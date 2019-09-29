@testable import Nano
import XCTest

private struct Wrapper<T> {
    let value: T
}

final class SequenceTests: XCTestCase {
    func test_interspersed() {
        let numbers = [1, 2, 3]
        let numbersWithZeroInBetween = Array(numbers.interspersed(0))

        XCTAssertEqual(numbersWithZeroInBetween, [1, 0, 2, 0, 3])
    }

    func test_reject() {
        let numbers = [1, 3, 5, 7, 10]
        let oddNumbers = numbers.reject { $0.isMultiple(of: 2) }

        XCTAssertFalse(oddNumbers.contains(10))
        XCTAssertEqual(oddNumbers.count, 4)
    }

    func test_sumForKeypath() {
        let numbers = [
            Wrapper(value: 1),
            Wrapper(value: 3),
            Wrapper(value: 5),
            Wrapper(value: 7),
            Wrapper(value: 10),
        ]

        XCTAssertEqual(numbers.sum(for: \.value), 26)
    }

    func test_sum() {
        let numbers = [1, 3, 5, 7, 10]
        XCTAssertEqual(numbers.sum(), 26)
    }

    static var allTests = [
        ("test_interspersed", test_interspersed),
        ("test_reject", test_reject),
        ("test_sum", test_sum),
    ]
}
