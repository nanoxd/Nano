@testable import Nano
import XCTest

private struct SUT {
    @Clamping(initialValue: 7.0, 0...14) var pH: Double

    init(pH: Double) {
        self.pH = pH
    }
}

final class ClampingTests: XCTestCase {
    func test_clampsLowerBoundRange() {
        let sut = SUT(pH: -2.0)
        XCTAssertEqual(sut.pH, 0)
    }

    func test_clampsUpperBoundRange() {
        let sut = SUT(pH: 16.5)
        XCTAssertEqual(sut.pH, 14)
    }

    func test_setsValueInRange() {
        let sut = SUT(pH: 4.67)
        XCTAssertEqual(sut.pH, 4.67)
    }
}
