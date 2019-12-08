@testable import Nano
import XCTest

final class CoreGraphicsTests: XCTestCase {
    func test_cgSizeAspectFit_returnsSizeWhenFit() {
        let boundingSize = CGSize(width: 200, height: 200)
        let buttonSize = CGSize(width: 10, height: 10)

        XCTAssertEqual(buttonSize, buttonSize.aspectFit(within: boundingSize))
    }

    func test_cgSizeAspectFit_returnsHeightConstrainedSize() {
        let boundingSize = CGSize(width: 80, height: 20)
        let buttonSize = CGSize(width: 100, height: 10)

        XCTAssertEqual(
            CGSize(width: 80, height: 8.0),
            buttonSize.aspectFit(within: boundingSize)
        )
    }

    func test_cgSizeAspectFit_returnsWidthConstrainedSize() {
        let boundingSize = CGSize(width: 80, height: 20)
        let buttonSize = CGSize(width: 40, height: 100)

        XCTAssertEqual(
            CGSize(width: 8, height: 20),
            buttonSize.aspectFit(within: boundingSize)
        )
    }
}
