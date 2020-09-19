#if os(iOS) || os(tvOS)
    import UIKit

    public typealias LayoutRelation = NSLayoutConstraint.Relation
    public typealias LayoutAttribute = NSLayoutConstraint.Attribute
    public typealias LayoutPriority = UILayoutPriority
#else
    import AppKit

    public typealias LayoutRelation = NSLayoutConstraint.Relation
    public typealias LayoutAttribute = NSLayoutConstraint.Attribute
    public typealias LayoutPriority = NSLayoutConstraint.Priority
#endif

// MARK: - Image

#if canImport(UIKit)
    import UIKit
    public typealias UXImage = UIImage
#elseif canImport(AppKit)
    import AppKit
    public typealias UXImage = NSImage
#elseif canImport(WatchKit)
    import WatchKit
    public typealias UXImage = UIImage
#endif
