#if canImport(UIKit)
    import UIKit

    /// An UILabel that allows insetting the label
    public class InsetLabel: UILabel {
        // MARK: - Properties

        /// The insets to inset the main `rect` by
        public var insets: UIEdgeInsets {
            didSet {
                setNeedsLayout()
            }
        }

        // MARK: - Initializers

        public init(insets: UIEdgeInsets, frame: CGRect = .zero) {
            self.insets = insets
            super.init(frame: frame)
        }

        required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

        // MARK: - Drawing

        public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
            let insetRect = bounds.inset(by: insets)
            let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
            let invertedInsets = UIEdgeInsets(top: -insets.top, left: -insets.left, bottom: -insets.bottom, right: -insets.right)

            return textRect.inset(by: invertedInsets)
        }

        public override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: insets))
        }
    }
#endif
