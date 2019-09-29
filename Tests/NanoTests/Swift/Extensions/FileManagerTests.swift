@testable import Nano
import XCTest

final class FileManagerTests: XCTestCase {
    func test_convert_kilobytesToBytes() {
        let bytes = FileManager.convert(fileSize: 1024, from: .kilobyte, to: .byte)
        XCTAssertEqual(bytes, 1_024_000)
    }

    func test_convert_gigabytesToMegabytes() {
        let megabytes = FileManager.convert(fileSize: 2048, from: .gigabyte, to: .megabyte)
        XCTAssertEqual(megabytes, 2_048_000)
    }
}
