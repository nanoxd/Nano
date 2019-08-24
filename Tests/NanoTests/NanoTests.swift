@testable import Nano
import XCTest

final class NanoTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Nano().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
