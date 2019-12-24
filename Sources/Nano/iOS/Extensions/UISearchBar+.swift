#if canImport(UIKit)
    import UIKit

    extension UISearchBar {
        private struct AssociatedKey {
            static var placeholderTextColor: UInt8 = 0
        }

        /// The text color for a given placeholder.
        @objc open dynamic var placeholderTextColor: UIColor? {
            /// Unfortunately, when the `searchBarStyle == .minimal` then
            /// `textField?.placeholderLabel?.textColor` doesn't work.
            get { associatedObject(&AssociatedKey.placeholderTextColor) }
            set {
                setAssociatedObject(&AssociatedKey.placeholderTextColor, value: newValue)

                // Redraw placeholder text on color change
                let placeholderText = placeholder
                placeholder = placeholderText
            }
        }
    }
#endif
