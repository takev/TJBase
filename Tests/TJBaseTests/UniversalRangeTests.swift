import XCTest
@testable import TJBase

class UniversalRangeTests: XCTestCase {
    func testScalar_ClosedRangeComparitors() {
        XCTAssertFalse(UniversalRange(2 ... 4) ~= 1)
        XCTAssertTrue (UniversalRange(2 ... 4) ~= 2)
        XCTAssertTrue (UniversalRange(2 ... 4) ~= 3)
        XCTAssertTrue (UniversalRange(2 ... 4) ~= 4)
        XCTAssertFalse(UniversalRange(2 ... 4) ~= 5)
    }

    func testScalar_RangeComparitors() {
        XCTAssertFalse(UniversalRange(2 ..< 4) ~= 1)
        XCTAssertTrue (UniversalRange(2 ..< 4) ~= 2)
        XCTAssertTrue (UniversalRange(2 ..< 4) ~= 3)
        XCTAssertFalse(UniversalRange(2 ..< 4) ~= 4)
        XCTAssertFalse(UniversalRange(2 ..< 4) ~= 5)
    }

    func testScalar_LOClosedRangeComparitors() {
        XCTAssertFalse(UniversalRange(leftOpen: 2 ... 4) ~= 1)
        XCTAssertFalse(UniversalRange(leftOpen: 2 ... 4) ~= 2)
        XCTAssertTrue (UniversalRange(leftOpen: 2 ... 4) ~= 3)
        XCTAssertTrue (UniversalRange(leftOpen: 2 ... 4) ~= 4)
        XCTAssertFalse(UniversalRange(leftOpen: 2 ... 4) ~= 5)
    }

    func testScalar_LORangeComparitors() {
        XCTAssertFalse(UniversalRange(leftOpen: 2 ..< 4) ~= 1)
        XCTAssertFalse(UniversalRange(leftOpen: 2 ..< 4) ~= 2)
        XCTAssertTrue (UniversalRange(leftOpen: 2 ..< 4) ~= 3)
        XCTAssertFalse(UniversalRange(leftOpen: 2 ..< 4) ~= 4)
        XCTAssertFalse(UniversalRange(leftOpen: 2 ..< 4) ~= 5)
    }

    func testScalar_PartialRangeThroughComparitors() {
        XCTAssertTrue (UniversalRange(...4) ~= Int.min)
        XCTAssertTrue (UniversalRange(...4) ~= 1)
        XCTAssertTrue (UniversalRange(...4) ~= 2)
        XCTAssertTrue (UniversalRange(...4) ~= 3)
        XCTAssertTrue (UniversalRange(...4) ~= 4)
        XCTAssertFalse(UniversalRange(...4) ~= 5)
    }

    func testScalar_PartialRangeUpToComparitors() {
        XCTAssertTrue (UniversalRange(..<4) ~= Int.min)
        XCTAssertTrue (UniversalRange(..<4) ~= 1)
        XCTAssertTrue (UniversalRange(..<4) ~= 2)
        XCTAssertTrue (UniversalRange(..<4) ~= 3)
        XCTAssertFalse(UniversalRange(..<4) ~= 4)
        XCTAssertFalse(UniversalRange(..<4) ~= 5)
    }

    func testScalar_PartialRangeFromComparitors() {
        XCTAssertFalse(UniversalRange(2...) ~= 1)
        XCTAssertTrue (UniversalRange(2...) ~= 2)
        XCTAssertTrue (UniversalRange(2...) ~= 3)
        XCTAssertTrue (UniversalRange(2...) ~= 4)
        XCTAssertTrue (UniversalRange(2...) ~= 5)
        XCTAssertTrue (UniversalRange(2...) ~= Int.max)
    }

    func testClosedRange_ClosedRangeComparitors() {
        XCTAssertFalse(UniversalRange(4 ... 6) ~= UniversalRange(1 ...  3))
        XCTAssertFalse(UniversalRange(4 ... 6) ~= UniversalRange(2 ...  4))
        XCTAssertFalse(UniversalRange(4 ... 6) ~= UniversalRange(3 ...  5))
        XCTAssertTrue (UniversalRange(4 ... 6) ~= UniversalRange(4 ...  6))
        XCTAssertFalse(UniversalRange(4 ... 6) ~= UniversalRange(5 ...  7))
        XCTAssertFalse(UniversalRange(4 ... 6) ~= UniversalRange(6 ...  8))
        XCTAssertFalse(UniversalRange(4 ... 6) ~= UniversalRange(7 ...  9))
        XCTAssertFalse(UniversalRange(4 ... 6) ~= UniversalRange(3 ...  6))
        XCTAssertFalse(UniversalRange(4 ... 6) ~= UniversalRange(3 ...  7))
        XCTAssertFalse(UniversalRange(4 ... 6) ~= UniversalRange(4 ...  7))
        XCTAssertTrue (UniversalRange(3 ... 7) ~= UniversalRange(4 ...  6))

        XCTAssertFalse(UniversalRange(1 ...  3) == UniversalRange(4 ... 6))
        XCTAssertFalse(UniversalRange(2 ...  4) == UniversalRange(4 ... 6))
        XCTAssertFalse(UniversalRange(3 ...  5) == UniversalRange(4 ... 6))
        XCTAssertTrue (UniversalRange(4 ...  6) == UniversalRange(4 ... 6))
        XCTAssertFalse(UniversalRange(5 ...  7) == UniversalRange(4 ... 6))
        XCTAssertFalse(UniversalRange(6 ...  8) == UniversalRange(4 ... 6))
        XCTAssertFalse(UniversalRange(7 ...  9) == UniversalRange(4 ... 6))
        XCTAssertFalse(UniversalRange(3 ...  6) == UniversalRange(4 ... 6))
        XCTAssertFalse(UniversalRange(3 ...  7) == UniversalRange(4 ... 6))
        XCTAssertFalse(UniversalRange(4 ...  7) == UniversalRange(4 ... 6))
        XCTAssertFalse(UniversalRange(4 ...  6) == UniversalRange(3 ... 7))
    }

    func testClosedRange_ClosedRangeSubtract() {
        XCTAssertEqual(UniversalRange(4 ... 7) - UniversalRange(5 ... 8),     [UniversalRange(4 ..< 5)])
        XCTAssertEqual(UniversalRange(4 ... 7) - UniversalRange(3 ... 5),     [UniversalRange(leftOpen:5 ... 7)])
        XCTAssertEqual(UniversalRange(4 ... 7) - UniversalRange(3 ... 8),     [])
        XCTAssertEqual(UniversalRange(4 ... 7) - UniversalRange(5 ... 6),     [UniversalRange(4 ..< 5), UniversalRange(leftOpen:6 ... 7)])
    }

    func testInfinteRange_AnyRangeSubtract() {
        XCTAssertEqual(UniversalRange() - UniversalRange(5 ... 8),            [UniversalRange(..<5), UniversalRange(leftOpen:8... as PartialRangeFrom)])
        XCTAssertEqual(UniversalRange() - UniversalRange(5 ..< 8),            [UniversalRange(..<5), UniversalRange(8... as PartialRangeFrom)])
    }

    static var allTests: [(String, (UniversalRangeTests) -> () -> Void)] = [
        ("testScalar_ClosedRangeComparitors", testScalar_ClosedRangeComparitors),
        ("testScalar_RangeComparitors", testScalar_RangeComparitors),
        ("testScalar_LOClosedRangeComparitors", testScalar_LOClosedRangeComparitors),
        ("testScalar_LORangeComparitors", testScalar_LORangeComparitors),
        ("testScalar_PartialRangeThroughComparitors", testScalar_PartialRangeThroughComparitors),
        ("testScalar_PartialRangeUpToComparitors", testScalar_PartialRangeUpToComparitors),
        ("testScalar_PartialRangeFromComparitors", testScalar_PartialRangeFromComparitors),
        ("testClosedRange_ClosedRangeComparitors", testClosedRange_ClosedRangeComparitors),
        ("testClosedRange_ClosedRangeSubtract", testClosedRange_ClosedRangeSubtract),
        ("testInfinteRange_AnyRangeSubtract", testInfinteRange_AnyRangeSubtract),
    ]
}
