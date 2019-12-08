@testable import Nano
import XCTest

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    final class NSButtonExtensionTests: XCTestCase {
        func test_isOn_representsState() {
            let button = NSButton()

            button.state = .on
            XCTAssertTrue(button.isOn)

            button.state = .off
            XCTAssertFalse(button.isOn)
        }

        func test_isOn_setsStateCorrectly() {
            let button = NSButton()

            XCTAssertEqual(button.state, .off)
            XCTAssertFalse(button.isOn)

            button.isOn = true
            XCTAssertEqual(button.state, .on)

            button.isOn = false
            XCTAssertEqual(button.state, .off)
        }
    }
#endif
