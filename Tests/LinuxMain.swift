import XCTest

import NanoTests

var tests = [XCTestCaseEntry]()
tests += NanoTests.allTests()
XCTMain(tests)
