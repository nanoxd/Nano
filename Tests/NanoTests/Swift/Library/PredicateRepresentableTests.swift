import XCTest

final class PredicateRepresentableTests: XCTestCase {
    private typealias TestData<OutputType> = (input: String, output: OutputType)

    private func testData(comparator: String) -> [TestData<String>] {
        [
            ("Lowe's", "identifier \(comparator) \"Lowe\'s\""),
            ("Lowes", "identifier \(comparator) \"Lowes\""),
            ("görsel", "identifier \(comparator) \"görsel\""),
            ("Can't Do it", "identifier \(comparator) \"Can\'t Do it\""),
        ]
    }

    func test_equal() {
        for item in testData(comparator: "==") {
            let testNative = NSPredicate(format: "%K == %@", "identifier", item.input).predicateFormat
            let testEqual = NSPredicate(field: "identifier", equal: item.input).predicateFormat
            XCTAssertEqual(testNative, item.output)
            XCTAssertEqual(testEqual, item.output)
        }
    }

    func test_notEqual() {
        for item in testData(comparator: "!=") {
            let testNative = NSPredicate(format: "identifier != %@", item.input).predicateFormat
            let testNotEqual = NSPredicate(field: "identifier", notEqual: item.input).predicateFormat
            XCTAssertEqual(testNative, item.output)
            XCTAssertEqual(testNotEqual, item.output)
        }
    }

    func test_between() {
        let data = ("Can't Do i\t", "Lowe's")
        let expectedOutput = "identifier BETWEEN {\"Can\'t Do i\t\", \"Lowe\'s\"}"

        let result = NSPredicate(field: "identifier", between: data.0, and: data.1).predicateFormat
        XCTAssertEqual(result, expectedOutput)
    }

    static var allTests = [
        ("test_equal", test_equal),
        ("test_notEqual", test_notEqual),
        ("test_between", test_between),
    ]
}
