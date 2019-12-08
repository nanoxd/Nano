@testable import Nano
import XCTest

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    final class NSViewExtensionTests: XCTestCase {
        func test_addSubviews_addsManyViews() {
            let view = NSView()
            let button = NSButton()
            let imageView = NSImageView()

            XCTAssertTrue(view.subviews.isEmpty)

            view.addSubviews([button, imageView])

            XCTAssertEqual(view.subviews.count, 2)
            XCTAssertEqual(view.subviews[0], button)
            XCTAssertEqual(view.subviews[1], imageView)
        }
    }
#endif
