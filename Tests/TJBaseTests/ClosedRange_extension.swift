import XCTest
@testable import TJBase

class ClosedRange_extensionsTests: XCTestCase {


    func testmergeOverlappingRanges() {
        XCTAssertEqual(
            mergeOverlappingRanges([] as [ClosedRange<Int>]),
            [] as [ClosedRange<Int>]
        )

        XCTAssertEqual(
            mergeOverlappingRanges([5 ... 10]),
            [5 ... 10]
        )

        XCTAssertEqual(
            mergeOverlappingRanges([5 ... 10, 11 ... 15]),
            [5 ... 10, 11 ... 15]
        )

        XCTAssertEqual(
            mergeOverlappingRanges([5 ... 10, 10 ... 15]),
            [5 ... 15]
        )

        XCTAssertEqual(
            mergeOverlappingRanges([10 ... 15, 5 ... 10]),
            [5 ... 15]
        )
    }

    static var allTests: [(String, (ClosedRange_extensionsTests) -> () -> Void)] = [
        ("testmergeOverlappingRanges", testmergeOverlappingRanges),
    ]
}

