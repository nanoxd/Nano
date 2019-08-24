#if canImport(UIKit)
    import UIKit

    public extension UIViewController {
        // MARK: - Properties

        /// Return `true` if the view is currently presented as a modal.
        var isModal: Bool {
            if presentingViewController != nil {
                return true
            }

            if presentingViewController?.presentedViewController == self {
                return true
            }

            if let navigationController = navigationController,
                navigationController.presentingViewController?.presentedViewController == navigationController {
                return true
            }

            if (tabBarController?.presentingViewController?.isKind(of: UITabBarController.self)) != nil {
                return true
            }

            return false
        }

        // MARK: Child Containment

        func add(child viewController: UIViewController, to containerView: UIView? = nil) {
            guard let containingView = containerView ?? view else { return }

            addChild(viewController)
            containingView.addSubview(viewController.view)
            viewController.didMove(toParent: self)
        }

        func insert(child viewController: UIViewController, belowSubview subview: UIView) {
            addChild(viewController)
            view.insertSubview(viewController.view, belowSubview: subview)
            viewController.didMove(toParent: self)
        }

        func insert(child viewController: UIViewController, aboveSubview subview: UIView) {
            addChild(viewController)
            view.insertSubview(viewController.view, aboveSubview: subview)
            viewController.didMove(toParent: self)
        }

        func insert(child viewController: UIViewController, at index: Int) {
            addChild(viewController)
            view.insertSubview(viewController.view, at: index)
            viewController.didMove(toParent: self)
        }

        func remove() {
            guard parent != nil else { return }

            willMove(toParent: nil)
            view.removeFromSuperview()
            removeFromParent()
        }
    }
#endif
