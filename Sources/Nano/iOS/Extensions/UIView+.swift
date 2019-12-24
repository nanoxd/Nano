#if canImport(UIKit)
    import UIKit

    public extension UIView {
        // MARK: - Properties

        var borderColor: UIColor {
            get { layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : .clear }
            set { layer.borderColor = newValue.cgColor }
        }

        var borderWidth: CGFloat {
            get { layer.borderWidth }
            set { layer.borderWidth = newValue }
        }

        var cornerRadius: CGFloat {
            get { layer.cornerRadius }
            set {
                layer.cornerRadius = newValue
                layer.masksToBounds = newValue > 0
            }
        }

        // MARK: - View Management

        /// Adds any number of subviews
        func addSubviews(_ views: UIView...) {
            views.forEach(addSubview(_:))
        }
    }
#endif
