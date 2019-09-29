#if canImport(UIKit)
    import UIKit
#else
    import AppKit
#endif

/// The base protocol for different constrainable types.
public protocol Anchor {
    /// The underlying value of the individual anchor.
    var rawValue: Int { get }

    /// An offset for the anchor from another anchor.
    var constant: CGFloat { get }

    /// The priority used to indivate to the constraint-based layout system which constraints are more or less important.
    var priority: LayoutPriority { get }

    init(rawValue: Int, constant: CGFloat, priority: LayoutPriority)
}

public extension Anchor {
    init(rawValue: Int) {
        self.init(rawValue: rawValue, constant: 0.0, priority: .required)
    }
}
