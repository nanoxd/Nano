#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit

    /// A Scrollable Stack View
    final class ScrollableStackView: NSView {
        // MARK: - Types

        final class FlippedClipView: NSClipView {
            override var isFlipped: Bool {
                true
            }
        }

        // MARK: - Subviews

        let stackView: NSStackView = {
            let stackView = NSStackView()
            stackView.orientation = .vertical
            return stackView
        }()

        private let scrollView = NSScrollView()

        // MARK: - Initializers

        override init(frame frameRect: NSRect) {
            super.init(frame: frameRect)
            setup()
        }

        required init?(coder decoder: NSCoder) {
            fatalError()
        }

        private func setup() {
            addSubview(scrollView)
            scrollView.hasVerticalScroller = true
            scrollView.drawsBackground = false

            scrollView.pinToSuperview()

            let clipView = FlippedClipView()
            clipView.drawsBackground = false
            scrollView.contentView = clipView

            clipView.pin(to: scrollView)

            scrollView.documentView = stackView
            clipView.pin(to: stackView, edges: [.top, .leading, .trailing])
        }
    }
#endif
