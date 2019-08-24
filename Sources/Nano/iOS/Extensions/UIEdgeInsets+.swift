#if canImport(UIKit)
    import UIKit

    // MARK: - ExpressibleByDictionaryLiteral

    extension UIEdgeInsets: ExpressibleByDictionaryLiteral {
        public typealias Key = EdgeKey
        public typealias Value = CGFloat

        public enum EdgeKey {
            case top
            case left
            case bottom
            case right
        }

        func keyPath(forEdge edgeKey: EdgeKey) -> WritableKeyPath<UIEdgeInsets, CGFloat> {
            switch edgeKey {
            case .top: return \UIEdgeInsets.top
            case .left: return \UIEdgeInsets.left
            case .bottom: return \UIEdgeInsets.bottom
            case .right: return \UIEdgeInsets.right
            }
        }

        public init(dictionaryLiteral elements: (EdgeKey, CGFloat)...) {
            self = UIEdgeInsets()

            for (edge, value) in elements {
                let keyPath = self.keyPath(forEdge: edge)
                self[keyPath: keyPath] = value
            }
        }
    }

    // MARK: - Custom Initializers

    public extension UIEdgeInsets {
        init(horizontal: CGFloat, vertical: CGFloat) {
            self = [
                .top: vertical,
                .left: horizontal,
                .bottom: vertical,
                .right: horizontal,
            ]
        }

        init(horizontal: CGFloat) {
            self = [.left: horizontal, .right: horizontal]
        }

        init(vertical: CGFloat) {
            self = [.top: vertical, .bottom: vertical]
        }
    }

#endif
