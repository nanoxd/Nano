#if canImport(UIKit)
    import UIKit

    public class BlurView: UIView {
        // MARK: - Properties

        /// Holds the observer token for accessibility changes
        private var observer: NSObjectProtocol?

        private var style: UIBlurEffect.Style = .light

        /// A property to determine opacity for the blur effect.
        /// Use this property to soften the blur effect if needed.
        ///
        /// The default value is `1`.
        ///
        /// - Note:
        /// This property is only used when `isSmartBlurEffectEnabled` is `true`
        /// and `UIAccessibility.isReduceTransparencyEnabled` is `false`.
        @objc public dynamic var blurOpacity: CGFloat = 1 {
            didSet {
                blurBackView.alpha = 1 - blurOpacity
            }
        }

        /// A property to determine color for the blur effect.
        ///
        /// The default value is `.white`.
        ///
        /// - Note:
        /// This property is only used when `isSmartBlurEffectEnabled` is `true`
        /// and `UIAccessibility.isReduceTransparencyEnabled` is `false`.
        @objc public dynamic var blurColor: UIColor = .white {
            didSet {
                blurBackView.backgroundColor = blurColor
            }
        }

        /// The background color to use when `UIAccessibility.isReduceTransparencyEnabled`
        /// is `true`.
        ///
        /// The default value is `.white`.
        ///
        /// - Note:
        /// This property is only used when `isSmartBlurEffectEnabled` is `true`
        /// and `UIAccessibilityIsReduceTransparencyEnabled()` is `false`.
        @objc public dynamic var blurEffectDisabledBackgroundColor: UIColor = .white

        /// The `UIVisualEffect` to use when `UIAccessibilityIsReduceTransparencyEnabled()` is `false`.
        ///
        /// The default value is `.light`.
        ///
        /// - Note:
        /// This property is only used when `isSmartBlurEffectEnabled` is `true`
        /// and `UIAccessibility.isReduceTransparencyEnabled` is `false`.
        @objc public dynamic var effect: UIVisualEffect? {
            get { blurEffectView.effect }
            set { blurEffectView.effect = newValue }
        }

        /// Returns a boolean value indicating whether reduce transparency is enabled.
        ///
        /// `true` if the user has enabled Reduce Transparency in **Settings**; otherwise, `false`.
        private var isReduceTransparencyEnabled: Bool {
            UIAccessibility.isReduceTransparencyEnabled
        }

        /// A boolean property to determine whether this view automatically enables blur effect.
        /// When this property is `false` this classs acts as normal `UIView`.
        ///
        /// The default value is `true`.
        ///
        /// - Note:
        /// When this property is `true` it only enables blur effect when
        /// `UIAccessibility.isReduceTransparencyEnabled` is `false`.
        /// Otherwise, `blurEffectDisabledBackgroundColor` value is used instead of
        ///  the blur effect.
        public var isSmartBlurEffectEnabled = true {
            didSet {
                guard oldValue != isSmartBlurEffectEnabled else { return }
                accessibilityReduceTransparencyStatusDidChange()
            }
        }

        // MARK: - Subviews

        private lazy var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: style))

        private lazy var blurBackView: UIView = {
            let view = UIView()
            view.backgroundColor = blurColor
            view.alpha = 1 - blurOpacity
            return view
        }()

        // MARK: - Lifecycle

        public init(style: UIBlurEffect.Style = .light) {
            self.style = style
            super.init(frame: .zero)
        }

        public required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        private func commonInit() {
            super.addSubview(blurBackView)
            super.addSubview(blurEffectView)
            NSLayoutConstraint.activate([
            ])

//            blurBackView.anchor.edges.equalToSuperview()
//            blurEffectView.anchor.edges.equalToSuperview()

            observer = NotificationCenter.default.addObserver(
                forName: UIAccessibility.reduceTransparencyStatusDidChangeNotification,
                object: nil,
                queue: nil,
                using: { [weak self] notification in
                    self?.accessibilityReduceTransparencyStatusDidChange()
                }
            )

            accessibilityReduceTransparencyStatusDidChange()
        }

        // MARK: - Methods

        override public func addSubview(_ view: UIView) {
            guard isSmartBlurEffectEnabled, !isReduceTransparencyEnabled else {
                super.addSubview(view)
                return
            }

            blurEffectView.contentView.addSubview(view)
        }

        override public func bringSubviewToFront(_ view: UIView) {
            guard isSmartBlurEffectEnabled, !isReduceTransparencyEnabled else {
                super.bringSubviewToFront(view)
                return
            }

            blurEffectView.contentView.bringSubviewToFront(view)
        }

        override public func sendSubviewToBack(_ view: UIView) {
            guard isSmartBlurEffectEnabled, !isReduceTransparencyEnabled else {
                super.sendSubviewToBack(view)
                return
            }

            blurEffectView.contentView.sendSubviewToBack(view)
        }

        private func accessibilityReduceTransparencyStatusDidChange() {
            guard isSmartBlurEffectEnabled else {
                blurBackView.isHidden = true
                blurEffectView.isHidden = true
                backgroundColor = .clear
                return
            }

            blurBackView.isHidden = isReduceTransparencyEnabled
            blurEffectView.isHidden = isReduceTransparencyEnabled
            backgroundColor = isReduceTransparencyEnabled
                ? blurEffectDisabledBackgroundColor
                : .clear
        }
    }
#endif
