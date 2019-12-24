#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit

    public extension NSViewController {
        // MARK: - Child Containment

        /// Adds a child view controller to `self` and adds it's subview to the given container view.
        func add(child viewController: NSViewController, to containerView: NSView? = nil) {
            let containingView = containerView ?? view

            addChild(viewController)
            containingView.addSubview(viewController.view)
        }

        /// Adds a child view controller and positions it's subview at the desired ordering mode relative to the subview.
        func insert(
            child viewController: NSViewController,
            positioned orderingMode: NSWindow.OrderingMode,
            toSubview subview: NSView
        ) {
            addChild(viewController)
            view.addSubview(viewController.view, positioned: orderingMode, relativeTo: subview)
        }

        /// Removes a child view controller and it's subview.
        func remove() {
            guard parent != nil else { return }

            view.removeFromSuperview()
            removeFromParent()
        }
    }
#endif
