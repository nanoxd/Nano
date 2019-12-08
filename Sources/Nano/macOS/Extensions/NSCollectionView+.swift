#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit

    public extension NSCollectionView {
        /// Scrolls to the top of the collection.
        func scrollToTop() {
            enclosingScrollView?.contentView.scroll(.zero)
        }
    }
#endif
