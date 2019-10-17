#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif

/// The representation of a constructed anchor matching values provided by `Anchorable`.
public struct SizeAnchor: OptionSet, Anchor {
    public let rawValue: Int
    public let constant: CGFloat
    public let priority: LayoutPriority

    public init(rawValue: Int, constant: CGFloat, priority: LayoutPriority = .required) {
        self.rawValue = rawValue
        self.constant = constant
        self.priority = priority
    }

    public static let width = SizeAnchor(rawValue: 1 << 1)
    public static let height = SizeAnchor(rawValue: 1 << 2)
    public static let allSides = [width, height]

    /// A function that allows you to create a width anchor using `.width(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.width` `SizeAnchor`.
    @discardableResult
    public static func width(_ constant: CGFloat, priority: LayoutPriority = .required) -> SizeAnchor {
        SizeAnchor(rawValue: SizeAnchor.width.rawValue, constant: constant, priority: priority)
    }

    /// A function that allows you to create a height anchor using `.height(constant)` syntax.
    ///
    /// - Parameters:
    ///   - constant: The constant for the underlying `NSLayoutConstraint`.
    ///   - priority: The priority for the underlying `NSLayoutConstraint`. Default argument is `.required`.
    /// - Returns: A `.height` `SizeAnchor`.
    @discardableResult
    public static func height(_ constant: CGFloat, priority: LayoutPriority = .required) -> SizeAnchor {
        SizeAnchor(rawValue: SizeAnchor.height.rawValue, constant: constant, priority: priority)
    }
}
