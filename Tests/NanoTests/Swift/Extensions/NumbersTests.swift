@testable import Nano
import XCTest

final class NumbersTests: XCTestCase {
    func test_digitCount() {
        XCTAssertEqual(1.digitCount, 1)
        XCTAssertEqual(121.digitCount, 3)
        XCTAssertEqual(121_322.digitCount, 6)
    }

    static var allTests = [
        ("test_digitCount", test_digitCount),
    ]
}
