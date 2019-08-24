@testable import Nano
import XCTest

final class SequenceTests: XCTestCase {
    func test_reject() {
        let numbers = [1, 3, 5, 7, 10]
        let oddNumbers = numbers.reject { $0.isMultiple(of: 2) }

        XCTAssertFalse(oddNumbers.contains(10))
        XCTAssertEqual(oddNumbers.count, 4)
    }

    func test_sum() {
        let numbers = [1, 3, 5, 7, 10]
        XCTAssertEqual(numbers.sum(), 26)
    }

    static var allTests = [
        ("test_reject", test_reject),
        ("test_sum", test_sum),
    ]
}
