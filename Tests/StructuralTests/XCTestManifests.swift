import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        return [
            testCase(AdditiveStructuralTests.allTests),
            testCase(CustomComparableTests.allTests),
            testCase(DebugStringStructuralTests.allTests),
            testCase(DecodeJSONStructuralTests.allTests),
            testCase(EncodeJSONTests.allTests),
            testCase(CustomEquatableTests.allTests),
            testCase(CustomHashableTests.allTests),
            testCase(InplaceAddTests.allTests),
            testCase(AbstractValueTests.allTests),
            testCase(DebugStringStructuralTests.allTests),
            testCase(CustomComparableTests.allTests),
            testCase(EncodeJSONTests.allTests),
        ]
    }
#endif
