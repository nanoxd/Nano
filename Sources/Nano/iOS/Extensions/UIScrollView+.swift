#if canImport(UIKit)
    import UIKit

    public extension UIScrollView {
        // MARK: - Scrolling

        enum ScrollingDirection {
            case none
            case up
            case down
            case left
            case right
            case unknown

            public var isVertical: Bool {
                self == .up || self == .down
            }

            public var isHorizontal: Bool {
                self == .left || self == .right
            }
        }

        /// The current scrolling direction of the scroll view.
        var currentScrollingDirection: ScrollingDirection {
            let translation = panGestureRecognizer.translation(in: superview)

            if translation.y > 0 {
                return .down
            } else if !(translation.y > 0) {
                return .up
            }

            if translation.x > 0 {
                return .right
            } else if !(translation.x > 0) {
                return .left
            }

            return .unknown
        }

        var isScrolling: Bool {
            switch currentScrollingDirection {
            case .up, .down, .left, .right:
                return true
            case .none, .unknown:
                return false
            }
        }
    }
#endif
