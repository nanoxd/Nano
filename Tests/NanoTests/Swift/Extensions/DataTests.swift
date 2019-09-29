@testable import Nano
import XCTest

final class DataTests: XCTestCase {
    func test_hexEncodedString_lowercased() {
        XCTAssertEqual(Data([0x0, 0xF]).hexEncodedString(), "000f")
    }

    func test_hexEncodedString_uppercased() {
        XCTAssertEqual(
            Data([0x0, 0xF]).hexEncodedString(options: .upperCase),
            "000F"
        )
    }

    static var allTests = [
        ("test_hexEncodedString_lowercased", test_hexEncodedString_lowercased),
        ("test_hexEncodedString_uppercased", test_hexEncodedString_uppercased),
    ]
}
