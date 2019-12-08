#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit

    public extension NSView {
        /// Adds many views to the view’s subviews so it’s displayed above its siblings.
        /// - Parameter views: The views to add to the view as subviews.
        func addSubviews(_ views: [NSView]) {
            views.forEach {
                addSubview($0)
            }
        }

        /// Animates `self` to appear as if it's shaking. Repeats four times.
        func shake() {
            let midX = layer?.position.x ?? 0
            let midY = layer?.position.y ?? 0

            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.06
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = CGPoint(x: midX - 10, y: midY)
            animation.toValue = CGPoint(x: midX + 10, y: midY)
            layer?.add(animation, forKey: "position")
        }
    }
#endif
