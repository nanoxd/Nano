@testable import Nano
import XCTest

final class DictionaryTests: XCTestCase {
    func test_compactMapValues() {
        let wordsToNumbers = ["one": 1, "two": 2]

        let wordsToEvenNumbers = wordsToNumbers.compactMapValues { value in
            value.isMultiple(of: 2)
                ? value * 2
                : nil
        }

        XCTAssertEqual(wordsToEvenNumbers["one"], nil)
        XCTAssertEqual(wordsToEvenNumbers["two"], 4)
    }

    func test_mapPairs() {
        let wordsToNumbers = ["one": 1, "two": 2]

        let mappedPairs = wordsToNumbers.mapPairs { element in
            (element.key + "s", element.value * 2)
        }

        XCTAssertEqual(mappedPairs["ones"], 2)
        XCTAssertEqual(mappedPairs["twos"], 4)
    }

    static var allTests = [
        ("test_compactMapValues", test_compactMapValues),
        ("test_mapPairs", test_mapPairs),
    ]
}
