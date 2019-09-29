#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif

/// The representation of a constructed anchor matching values provided by `Anchorable`.
public struct EdgeAnchor: OptionSet, Anchor {
    public let rawValue: Int
    public let constant: CGFloat
    public let priority: LayoutPriority

    public init(rawValue: Int, constant: CGFloat, priority: LayoutPriority = .required) {
        self.rawValue = rawValue
        self.constant = constant
        self.priority = priority
    }

    public static let leading = EdgeAnchor(rawValue: 1 << 1)

    public static let trailing = EdgeAnchor(rawValue: 1 << 2)

    public static let left = EdgeAnchor(rawValue: 1 << 3)

    public static let right = EdgeAnchor(rawValue: 1 << 4)

    public static let top = EdgeAnchor(rawValue: 1 << 5)

    public static let bottom = EdgeAnchor(rawValue: 1 << 6)

    public static let centerX = EdgeAnchor(rawValue: 1 << 7)

    public static let centerY = EdgeAnchor(rawValue: 1 << 8)

    public static let width = EdgeAnchor(rawValue: 1 << 9)

    public static let height = EdgeAnchor(rawValue: 1 << 10)

    public static let allSides = [leading, trailing, top, bottom]

    /// A function that allows you to create a leading anchor using `.leading(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.leading` `EdgeAnchor`.
    @discardableResult
    public static func leading(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.leading.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a trailing anchor using `.trailing(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.trailing` `EdgeAnchor`.
    @discardableResult
    public static func trailing(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.trailing.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a left anchor using `.left(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.left` `EdgeAnchor`.
    @discardableResult
    public static func left(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.left.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a right anchor using `.right(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.right` `EdgeAnchor`.
    @discardableResult
    public static func right(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.right.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a top anchor using `.top(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.top` `EdgeAnchor`.
    @discardableResult
    public static func top(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.top.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a bottom anchor using `.bottom(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.bottom` `EdgeAnchor`.
    @discardableResult
    public static func bottom(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.bottom.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a centerX anchor using `.centerX(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.centerX` `EdgeAnchor`.
    @discardableResult
    public static func centerX(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.centerX.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a centerY anchor using `.centerY(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.centerY` `EdgeAnchor`.
    @discardableResult
    public static func centerY(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.centerY.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a width anchor using `.width(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.width` `EdgeAnchor`.
    @discardableResult
    public static func width(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.width.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a height anchor using `.height(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.height` `EdgeAnchor`.
    @discardableResult
    public static func height(_ constant: CGFloat, priority: LayoutPriority = .required) -> EdgeAnchor {
        return EdgeAnchor(rawValue: EdgeAnchor.height.rawValue, constant: constant, priority: priority)
    }
}
