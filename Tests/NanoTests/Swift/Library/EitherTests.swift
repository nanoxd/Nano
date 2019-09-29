@testable import Nano
import XCTest

final class EitherTests: XCTestCase {
    private let left = Either<Int, String>.left(4)
    private let right = Either<Int, String>.right("four")

    func test_isLeft() {
        XCTAssertTrue(left.isLeft)
        XCTAssertFalse(left.isRight)
    }

    func test_isRight() {
        XCTAssertTrue(right.isRight)
        XCTAssertFalse(right.isLeft)
    }

    func test_either_ifLeft() {
        let phone = Either<String, Int>.left("(323) 555-1212")

        let hasPhone = phone.either(
            ifLeft: constant(true),
            ifRight: constant(false)
        )

        XCTAssertTrue(hasPhone)
    }

    func test_either_ifRight() {
        let phone = Either<String, Int>.right(3_235_551_212)

        let prettyPhone = phone.either(
            ifLeft: identity,
            ifRight: { String($0) }
        )

        XCTAssertEqual(prettyPhone, "3235551212")
    }

    func test_map_ignoresLeft() {
        let result = left.map(constant(5))
            .either(ifLeft: identity, ifRight: identity)

        XCTAssertEqual(result, 4)
    }

    func test_map_appliesToRight() {
        let result = right.map(constant(5))
            .either(ifLeft: identity, ifRight: identity)

        XCTAssertEqual(result, 5)
    }

    func test_mapLeft_ignoresRight() {
        let result = right.mapLeft(constant("five"))
            .either(ifLeft: identity, ifRight: identity)

        XCTAssertEqual(result, "four")
    }

    func test_mapLeft_appliesToLeft() {
        let result = left.mapLeft(constant("five"))
            .either(ifLeft: identity, ifRight: identity)

        XCTAssertEqual(result, "five")
    }

    func test_bimap_appliesToRight() {
        let result = right.bimap(leftBy: { $0 + 1 }, rightBy: constant("Five"))

        guard let str = result.right else {
            XCTFail()
            return
        }

        XCTAssertEqual(str, "Five")
    }

    func test_bimap_appliesToLeft() {
        let result = left.bimap(leftBy: { $0 + 1 }, rightBy: constant("Five"))

        guard let int = result.left else {
            XCTFail()
            return
        }

        XCTAssertEqual(int, 5)
    }

    func test_description_onLeft() {
        XCTAssertEqual(left.description, ".left(4)")
    }

    func test_description_onRight() {
        XCTAssertEqual(right.description, ".right(four)")
    }

    static var allTests = [
        ("test_isLeft", test_isLeft),
        ("test_isRight", test_isRight),
        ("test_either_ifLeft", test_either_ifLeft),
        ("test_either_ifRight", test_either_ifRight),
        ("test_map_ignoresLeft", test_map_ignoresLeft),
        ("test_map_appliesToRight", test_map_appliesToRight),
        ("test_mapLeft_ignoresRight", test_mapLeft_ignoresRight),
        ("test_mapLeft_appliesToLeft", test_mapLeft_appliesToLeft),
        ("test_bimap_appliesToRight", test_bimap_appliesToRight),
        ("test_bimap_appliesToLeft", test_bimap_appliesToLeft),
        ("test_description_onLeft", test_description_onLeft),
        ("test_description_onRight", test_description_onRight),
    ]
}
