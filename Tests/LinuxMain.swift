import NanoTests
import XCTest

var tests = [XCTestCaseEntry]()
tests += NanoTests.allTests()
tests += CollectionTests.allTests()
tests += DictionaryTests.allTests()
tests += NumbersTests.allTests()
tests += SequenceTests.allTests()
XCTMain(tests)
