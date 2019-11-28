@testable import EliteCore
import XCTest

final class RegexTests: XCTestCase {
    func test_matches_integers() {
        let regex = Regex.integers
        XCTAssertTrue(regex.matches("1532"))
    }

    func test_match_capturesNumbers() {
        let string = "I have 14 chickens in 2 coops."
        let match = Regex.integers.match(string)
        XCTAssertEqual(match?.int(0), 14)
    }

    func test_matches_returnsBothMatches() {
        let string = "I have 14 chickens in 2 coops."
        let matches = Regex.integers.matches(in: string)

        XCTAssertEqual(matches.count, 2)
        XCTAssertEqual(matches[0].int(0), 14)
        XCTAssertEqual(matches[1].int(0), 2)
    }

    static var allTests = [
        ("test_matches_integers", test_matches_integers),
        ("test_match_capturesNumbers", test_match_capturesNumbers),
        ("test_matches_returnsBothMatches", test_matches_returnsBothMatches),
    ]
}
