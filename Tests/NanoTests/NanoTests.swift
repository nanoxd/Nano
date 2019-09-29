@testable import Nano
import XCTest

final class NanoTests: XCTestCase {
    func test_constant() {
        let oddNumbers = [1, 3, 5]
        let allTwos = oddNumbers.map(constant(2))

        XCTAssertEqual(allTwos, [2, 2, 2])
    }

    func test_identity() {
        XCTAssertEqual(identity(5), 5)
    }

    static var allTests = [
        ("test_constant", test_constant),
        ("test_identity", test_identity),
    ]
}
