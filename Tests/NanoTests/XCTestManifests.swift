import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        return [
            testCase(NanoTests.allTests),
            testCase(CollectionTests.allTests),
            testCase(DictionaryTests.allTests),
            testCase(NumbersTests.allTests),
            testCase(SequenceTests.allTests),
        ]
    }
#endif
