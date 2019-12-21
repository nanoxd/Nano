@testable import Nano
import XCTest

final class CollectionTests: XCTestCase {
    func test_anySatisfy() {
        let collection = [1, 3, 5, 7, 10]

        XCTAssertTrue(collection.anySatisfy { $0.isMultiple(of: 2) })
        XCTAssertFalse(collection.anySatisfy { $0 == 15 })
    }

    func test_countWhere() {
        let names = ["Rob", "Juan", "Kim", "Ari"]

        XCTAssertEqual(
            names.count(where: { $0.count > 3 }),
            1
        )
    }

    func test_eachPair() {
        let numbers = [1, 2, 3, 4, 5]
        let pairs = Array(numbers.eachPair())

        XCTAssertEqual(pairs.first?.0, 1)
        XCTAssertEqual(pairs.first?.1, 2)
        XCTAssertEqual(pairs.last?.0, 4)
        XCTAssertEqual(pairs.last?.1, 5)
    }

    func test_partitionBy() {
        let wizards = ["Draco Malfoy", "Harry Potter", "Hermione Granger"]
        let splitWizards = wizards.partition { wizard in
            wizard.first == "H"
        }

        XCTAssertEqual(splitWizards.0, Array(wizards.dropFirst()))
        XCTAssertEqual(splitWizards.1, [wizards[0]])
    }

    func test_strideByStep() {
        let numbers = Array(1...10)
        var oddNumberSequence = numbers.stride(by: 2)
        XCTAssertEqual(oddNumberSequence.next(), 1)
        XCTAssertEqual(oddNumberSequence.next(), 3)
        XCTAssertEqual(oddNumberSequence.next(), 5)
        XCTAssertEqual(oddNumberSequence.next(), 7)
        XCTAssertEqual(oddNumberSequence.next(), 9)
        XCTAssertNil(oddNumberSequence.next())
    }

    func test_strideByStep_fromStart() {
        let numbers = Array(1...10)
        var evenNumberSequence = numbers.stride(by: 2, from: 1)
        XCTAssertEqual(evenNumberSequence.next(), 2)
        XCTAssertEqual(evenNumberSequence.next(), 4)
        XCTAssertEqual(evenNumberSequence.next(), 6)
        XCTAssertEqual(evenNumberSequence.next(), 8)
        XCTAssertEqual(evenNumberSequence.next(), 10)
        XCTAssertNil(evenNumberSequence.next())
    }

    func test_strideByStep_toEnd() {
        let numbers = Array(1...10)
        var oddNumbersUpToFiveSequence = numbers.stride(by: 2, to: 5)
        XCTAssertEqual(oddNumbersUpToFiveSequence.next(), 1)
        XCTAssertEqual(oddNumbersUpToFiveSequence.next(), 3)
        XCTAssertEqual(oddNumbersUpToFiveSequence.next(), 5)
        XCTAssertNil(oddNumbersUpToFiveSequence.next())
    }

    func test_strideByStep_throughEnd() {
        let numbers = Array(1...10)
        var oddNumbersUpToFiveSequence = numbers.stride(by: 2, through: 5)
        XCTAssertEqual(oddNumbersUpToFiveSequence.next(), 1)
        XCTAssertEqual(oddNumbersUpToFiveSequence.next(), 3)
        XCTAssertEqual(oddNumbersUpToFiveSequence.next(), 5)
        XCTAssertNil(oddNumbersUpToFiveSequence.next())
    }

    func test_strideByStep_fromStart_throughEnd() {
        let empty = [Int]()
        var emptySequence = empty.stride(by: 2, from: 0, through: 10)
        XCTAssertNil(emptySequence.next())
    }

    func test_subscript_safe() {
        let numbers = [1, 2]

        XCTAssertNotNil(numbers[safe: 1])
        XCTAssertNil(numbers[safe: 2])
    }

    static var allTests = [
        ("test_anySatisfy", test_anySatisfy),
        ("test_countWhere", test_countWhere),
        ("test_eachPair", test_eachPair),
        ("test_partitionBy", test_partitionBy),
        ("test_strideByStep", test_strideByStep),
        ("test_strideByStep_fromStart", test_strideByStep_fromStart),
        ("test_strideByStep_toEnd", test_strideByStep_toEnd),
        ("test_strideByStep_throughEnd", test_strideByStep_throughEnd),
        ("test_strideByStep_fromStart_throughEnd", test_strideByStep_fromStart_throughEnd),
        ("test_subscript_safe", test_countWhere),
    ]
}
