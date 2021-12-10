#if canImport(AppKit)
    import AppKit

    public extension NSView {
        /// A function that allows you to pin the current `NSView` to another `NSView`.
        ///
        /// - Parameters:
        ///   - view: The `NSView` that we will constrain the current `NSView` to.
        ///   - edges: The `EdgeAnchor`s we wish to create `NSLayoutConstraint`s for.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `[NSLayoutConstraint]` between the current `NSView` and another `NSView`.
        @discardableResult
        func pin(
            to view: NSView,
            edges: [EdgeAnchor] = EdgeAnchor.allSides,
            relation: LayoutRelation = .equal,
            isActive: Bool = true
        ) -> [NSLayoutConstraint] {
            translatesAutoresizingMaskIntoConstraints = false

            return pin(toAnchorable: view, edges: edges, relation: relation, isActive: isActive)
        }

        /// A function that allows you to pin the current `NSView` to a `NSLayoutGuide`.
        ///
        /// - Parameters:
        ///   - layoutGuide: The `NSLayoutGuide` that we will constrain the current `NSView` to.
        ///   - edges: The `EdgeAnchor`s we wish to create `NSLayoutConstraint`s for.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `[NSLayoutConstraint]` between the current `NSView` and a `NSLayoutGuide`.
        @discardableResult
        func pin(
            to layoutGuide: NSLayoutGuide,
            edges: [EdgeAnchor] = EdgeAnchor.allSides,
            relation: LayoutRelation = .equal,
            isActive: Bool = true
        ) -> [NSLayoutConstraint] {
            translatesAutoresizingMaskIntoConstraints = false

            return pin(toAnchorable: layoutGuide, edges: edges, relation: relation, isActive: isActive)
        }

        /// A function that allows you to pin the current `NSView` to a `NSView`.
        ///
        /// - Parameters:
        ///   - edge: The `EdgeAnchor` of the current `NSView` we wish to create an `NSLayoutConstraint` for.
        ///   - toEdge: The `EdgeAnchor` of the `NSView` we wish to create an `NSLayoutConstraint` for.
        ///   - view: The `NSView` that we will constrain the current `NSView` to.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - constant: The constant for the underlying `NSLayoutConstraint`.
        ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `NSLayoutConstraint` between the current `NSView`'s `EdgeAnchor` and another `NSView`'s `EdgeAnchor`.
        @discardableResult
        func pin(
            edge: EdgeAnchor,
            toEdge: EdgeAnchor,
            of view: NSView,
            relation: LayoutRelation = .equal,
            constant: CGFloat = 0.0,
            priority: LayoutPriority = .required,
            isActive: Bool = true
        ) -> NSLayoutConstraint {
            translatesAutoresizingMaskIntoConstraints = false

            return pin(
                edge: edge,
                toEdge: toEdge,
                ofAnchorable: view,
                relation: relation,
                constant: constant,
                priority: priority,
                isActive: isActive
            )
        }

        /// A function that allows you to pin edges from the current `NSView` to it's superview.
        ///
        /// - Parameters:
        ///   - edge: The `EdgeAnchor` of the current `NSView` we wish to create an `NSLayoutConstraint` for.
        ///   - toEdge: The `EdgeAnchor` of the `NSLayoutGuide` we wish to create an `NSLayoutConstraint` for.
        ///   - layoutGuide: The `NSLayoutGuide` that we will constrain the current `NSView` to.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - constant: The constant for the underlying `NSLayoutConstraint`.
        ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `NSLayoutConstraint` between the current `NSView`'s `EdgeAnchor` and another `NSLayoutGuide`'s `EdgeAnchor`.
        @discardableResult
        func pin(
            edge: EdgeAnchor,
            toEdge: EdgeAnchor,
            of layoutGuide: NSLayoutGuide,
            relation: LayoutRelation = .equal,
            constant: CGFloat = 0.0,
            priority: NSLayoutConstraint.Priority = .required,
            isActive: Bool = true
        ) -> NSLayoutConstraint {
            pin(
                edge: edge,
                toEdge: toEdge,
                ofAnchorable: layoutGuide,
                relation: relation,
                constant: constant,
                priority: priority,
                isActive: isActive
            )
        }

        /// A function that allows you to pin edges from the current `NSView` to it's superview.
        ///
        /// - Parameters:
        ///   - edges: The `EdgeAnchor`s we wish to create `NSLayoutConstraint`s for.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `[NSLayoutConstraint]` between the current `NSView` and it's superview.
        @discardableResult
        func pinToSuperview(
            _ edges: [EdgeAnchor] = EdgeAnchor.allSides,
            relation: LayoutRelation = .equal,
            isActive: Bool = true
        ) -> [NSLayoutConstraint] {
            guard let superview = superview else {
                fatalError("Cannot pin to a nil superview")
            }

            return pin(to: superview, edges: edges, isActive: isActive)
        }

        /// A function that allows you to pin the one dimension of the current `NSView` to another `NSView`.
        ///
        /// - Parameters:
        ///   - sizeAnchor: The `SizeAnchor` of the current `NSView` we wish to create an `NSLayoutConstraint` for.
        ///   - toSizeAnchor: The `SizeAnchor` of the other `NSView` we wish to create an `NSLayoutConstraint` for.
        ///   - view: The `NSView` that we will constrain the current `NSView` to.
        ///   - multiplier: The multiplier for the underlying `NSLayoutConstraint`.
        ///   - constant: The constant for the underlying `NSLayoutConstraint`.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `NSLayoutConstraint` between the current `NSView`'s `SizeAnchor`
        /// and another `NSLayoutGuide`'s `SizeAnchor`.
        @discardableResult
        func set(
            relativeSize sizeAnchor: SizeAnchor,
            toSizeAnchor: SizeAnchor,
            of view: NSView,
            multiplier: CGFloat,
            constant: CGFloat,
            relation: LayoutRelation = .equal,
            isActive: Bool = true
        ) -> NSLayoutConstraint {
            translatesAutoresizingMaskIntoConstraints = false

            return set(
                relativeSize: sizeAnchor,
                toSizeAnchor: toSizeAnchor,
                ofAnchorable: view,
                multiplier: multiplier,
                constant: constant,
                relation: relation,
                isActive: isActive
            )
        }

        /// A function that allows you to pin the one dimension of the current `NSView` to another `NSLayoutGuide`.
        ///
        /// - Parameters:
        ///   - sizeAnchor: The `SizeAnchor` of the current `NSView` we wish to create an `NSLayoutConstraint` for.
        ///   - toSizeAnchor: The `SizeAnchor` of the other `NSView` we wish to create an `NSLayoutConstraint` for.
        ///   - layoutGuide: The `NSLayoutGuide` that we will constrain the current `NSView` to.
        ///   - multiplier: The multiplier for the underlying `NSLayoutConstraint`.
        ///   - constant: The constant for the underlying `NSLayoutConstraint`.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `NSLayoutConstraint` between the current `NSView`'s `SizeAnchor` and another `NSLayoutGuide`'s `SizeAnchor`.
        @discardableResult
        func set(
            relativeSize sizeAnchor: SizeAnchor,
            toSizeAnchor: SizeAnchor,
            of layoutGuide: NSLayoutGuide,
            multiplier: CGFloat,
            constant: CGFloat,
            relation: LayoutRelation = .equal,
            isActive: Bool = true
        ) -> NSLayoutConstraint {
            translatesAutoresizingMaskIntoConstraints = false

            return set(
                relativeSize: sizeAnchor,
                toSizeAnchor: toSizeAnchor,
                ofAnchorable: layoutGuide,
                multiplier: multiplier,
                constant: constant,
                relation: relation,
                isActive: isActive
            )
        }
    }

    public extension NSLayoutGuide {
        /// A function that allows you to pin the current `NSLayoutGuide` to another `NSLayoutGuide`.
        ///
        /// - Parameters:
        ///   - layoutGuide: The `NSLayoutGuide` that we are pinning the current `NSLayoutGuide` to.
        ///   - edges: The `EdgeAnchor`s we wish to create `NSLayoutConstraint`s for.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `[NSLayoutConstraint]` between the current `NSLayoutGuide` and another `NSLayoutGuide`.
        @discardableResult
        func pin(
            to layoutGuide: NSLayoutGuide,
            edges: [EdgeAnchor] = EdgeAnchor.allSides,
            relation: LayoutRelation = .equal,
            isActive: Bool = true
        ) -> [NSLayoutConstraint] {
            pin(toAnchorable: layoutGuide, edges: edges, relation: relation, isActive: isActive)
        }

        /// A function that allows you to pin the current `NSLayoutGuide` to a `NSView`.
        ///
        /// - Parameters:
        ///   - view: The `NSView` that we are pinning the current `NSLayoutGuide` to.
        ///   - edges: The `EdgeAnchor`s we wish to create `NSLayoutConstraint`s for.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `[NSLayoutConstraint]` between the current `NSLayoutGuide` and another `NSView`.
        @discardableResult
        func pin(
            to view: NSView,
            edges: [EdgeAnchor] = EdgeAnchor.allSides,
            relation: LayoutRelation = .equal,
            isActive: Bool = true
        ) -> [NSLayoutConstraint] {
            pin(toAnchorable: view, edges: edges, relation: relation, isActive: isActive)
        }

        /// A function that allows you to pin the one edge of the current `NSLayoutGuide` to another `NSLayoutGuide`.
        ///
        /// - Parameters:
        ///   - edge: The `EdgeAnchor` of the current `NSLayoutGuide` we wish to create an `NSLayoutConstraint` for.
        ///   - toEdge: The `EdgeAnchor` of the `NSLayoutGuide` we wish to create an `NSLayoutConstraint` for.
        ///   - layoutGuide: The `NSLayoutGuide` we wish to constrain the current `NSLayoutGuide` to.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - constant: The constant offset between the two `NSLayoutGuide`s.
        ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `NSLayoutConstraint` between the current `NSLayoutGuide` and another `NSLayoutGuide`.
        @discardableResult
        func pin(
            edge: EdgeAnchor,
            toEdge: EdgeAnchor,
            of layoutGuide: NSLayoutGuide,
            relation: LayoutRelation = .equal,
            constant: CGFloat = 0.0,
            priority: LayoutPriority = .required,
            isActive: Bool = true
        ) -> NSLayoutConstraint {
            pin(
                edge: edge,
                toEdge: toEdge,
                ofAnchorable: layoutGuide,
                relation: relation,
                constant: constant,
                priority: priority,
                isActive: isActive
            )
        }

        /// A function that allows you to pin the one edge of the current `NSLayoutGuide` to a `NSView`.
        ///
        /// - Parameters:
        ///   - edge: The `EdgeAnchor` of the current `NSLayoutGuide` we wish to create an `NSLayoutConstraint` for.
        ///   - toEdge: The `EdgeAnchor` of the `NSView` we wish to create an `NSLayoutConstraint` for.
        ///   - view: The `NSView` we wish to constrain the current `NSLayoutGuide` to.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - constant: The constant for the underlying `NSLayoutConstraint`.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `NSLayoutConstraint` between the current `NSLayoutGuide` and another `NSView`.
        @discardableResult
        func pin(
            edge: EdgeAnchor,
            toEdge: EdgeAnchor,
            of view: NSView,
            relation: LayoutRelation = .equal,
            constant: CGFloat = 0.0,
            priority: NSLayoutConstraint.Priority = .required,
            isActive: Bool = true
        ) -> NSLayoutConstraint {
            pin(
                edge: edge,
                toEdge: toEdge,
                ofAnchorable: view,
                relation: relation,
                constant: constant,
                priority: priority,
                isActive: isActive
            )
        }

        /// A function that allows you to pin the one dimension of the current `NSLayoutGuide` to another `NSLayoutGuide`.
        ///
        /// - Parameters:
        ///   - sizeAnchor: The `SizeAnchor` of the current `NSLayoutGuide` we wish to create an `NSLayoutConstraint` for.
        ///   - toSizeAnchor: The `SizeAnchor` of the other `NSLayoutGuide` we wish to create an `NSLayoutConstraint` for.
        ///   - layoutGuide: The `NSLayoutGuide` we wish to constrain the current `NSLayoutGuide` to.
        ///   - multiplier: The multiplier for the underlying `NSLayoutConstraint`.
        ///   - constant: The constant for the underlying `NSLayoutConstraint`.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `NSLayoutConstraint` between the current `NSLayoutGuide` and another `NSView`.
        @discardableResult
        func set(
            relativeSize sizeAnchor: SizeAnchor,
            toSizeAnchor: SizeAnchor,
            of layoutGuide: NSLayoutGuide,
            multiplier: CGFloat,
            constant: CGFloat,
            relation: LayoutRelation,
            isActive: Bool
        ) -> NSLayoutConstraint {
            set(
                relativeSize: sizeAnchor,
                toSizeAnchor: toSizeAnchor,
                ofAnchorable: layoutGuide,
                multiplier: multiplier,
                constant: constant,
                relation: relation,
                isActive: isActive
            )
        }

        /// A function that allows you to pin the one dimension of the current `NSLayoutGuide` to another `NSView`.
        ///
        /// - Parameters:
        ///   - sizeAnchor: The `SizeAnchor` of the current `NSLayoutGuide` we wish to create an `NSLayoutConstraint` for.
        ///   - toSizeAnchor: The `SizeAnchor` of the other `NSLayoutGuide` we wish to create an `NSLayoutConstraint` for.
        ///   - view: The `NSView` we wish to constrain the current `NSLayoutGuide` to.
        ///   - multiplier: The multiplier for the underlying `NSLayoutConstraint`.
        ///   - constant: The constant for the underlying `NSLayoutConstraint`.
        ///   - relation: The relation to apply to the underlying `NSLayoutConstraint`.
        ///   - isActive: Whether or not the underlying `NSLayoutConstraint` will be active.
        /// - Returns: An `NSLayoutConstraint` between the current `NSLayoutGuide` and another `NSView`.
        @discardableResult
        func set(
            relativeSize sizeAnchor: SizeAnchor,
            toSizeAnchor: SizeAnchor,
            of view: NSView,
            multiplier: CGFloat,
            constant: CGFloat,
            relation: LayoutRelation,
            isActive: Bool
        ) -> NSLayoutConstraint {
            set(
                relativeSize: sizeAnchor,
                toSizeAnchor: toSizeAnchor,
                ofAnchorable: view,
                multiplier: multiplier,
                constant: constant,
                relation: relation,
                isActive: isActive
            )
        }
    }
#endif
