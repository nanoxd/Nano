@testable import Nano
import XCTest

final class DateTests: XCTestCase {
    func test_unixTimeMilliseconds() {
        XCTAssertEqual(Date(timeIntervalSince1970: 1023).unixTimeMilliseconds, 1_023_000)
        XCTAssertEqual(Date(timeIntervalSince1970: 104_323).unixTimeMilliseconds, 104_323_000)
    }

    static var allTests = [
        ("test_unixTimeMilliseconds", test_unixTimeMilliseconds),
    ]
}
