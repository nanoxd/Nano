@testable import Nano
import XCTest

final class BinaryFloatingPointTests: XCTestCase {
    func test_rounded_up() {
        let number = 3.1415927
        XCTAssertEqual(number.rounded(numberOfDecimalPlaces: 3, rule: .up), 3.142)
    }

    func test_rounded_down() {
        let number = 3.1415927
        XCTAssertEqual(number.rounded(numberOfDecimalPlaces: 3, rule: .down), 3.141)
    }

    func test_rounded_awayFromZero() {
        let number = 3.1415927
        XCTAssertEqual(number.rounded(numberOfDecimalPlaces: 2, rule: .awayFromZero), 3.15)
    }

    func test_rounded_towardZero() {
        let number = 3.1415927
        XCTAssertEqual(number.rounded(numberOfDecimalPlaces: 4, rule: .towardZero), 3.1415)
    }

    func test_rounded_toNearestOrEven() {
        let number = 3.1415927
        XCTAssertEqual(number.rounded(numberOfDecimalPlaces: -1, rule: .toNearestOrEven), 3)
    }

    static var allTests = [
        ("test_rounded_up", test_rounded_up),
        ("test_rounded_down", test_rounded_down),
        ("test_rounded_awayFromZero", test_rounded_awayFromZero),
        ("test_rounded_towardZero", test_rounded_towardZero),
        ("test_rounded_toNearestOrEven", test_rounded_toNearestOrEven),
    ]
}
