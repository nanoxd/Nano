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

    func test_partitionBy() {
        let wizards = ["Draco Malfoy", "Harry Potter", "Hermione Granger"]
        let splitWizards = wizards.partition { wizard in
            wizard.first == "H"
        }

        XCTAssertEqual(splitWizards.0, Array(wizards.dropFirst()))
        XCTAssertEqual(splitWizards.1, [wizards[0]])
    }

    func test_subscript_safe() {
        let numbers = [1, 2]

        XCTAssertNotNil(numbers[safe: 1])
        XCTAssertNil(numbers[safe: 2])
    }

    static var allTests = [
        ("test_anySatisfy", test_anySatisfy),
        ("test_countWhere", test_countWhere),
        ("test_partitionBy", test_partitionBy),
        ("test_subscript_safe", test_countWhere),
    ]
}
