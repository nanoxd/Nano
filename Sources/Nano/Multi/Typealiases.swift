#if os(iOS) || os(tvOS)
    import UIKit

    #if swift(>=4.2)
        public typealias LayoutRelation = NSLayoutConstraint.Relation
        public typealias LayoutAttribute = NSLayoutConstraint.Attribute
    #else
        public typealias LayoutRelation = NSLayoutRelation
        public typealias LayoutAttribute = NSLayoutAttribute
    #endif

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
