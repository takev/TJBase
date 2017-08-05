import XCTest
@testable import TJBase

class TJRangeTests: XCTestCase {
    func testScalar_ClosedRangeComparitors() {
        XCTAssertFalse(TJRange(2 ... 4) ~= 1)
        XCTAssertTrue (TJRange(2 ... 4) ~= 2)
        XCTAssertTrue (TJRange(2 ... 4) ~= 3)
        XCTAssertTrue (TJRange(2 ... 4) ~= 4)
        XCTAssertFalse(TJRange(2 ... 4) ~= 5)
    }

    func testScalar_RangeComparitors() {
        XCTAssertFalse(TJRange(2 ..< 4) ~= 1)
        XCTAssertTrue (TJRange(2 ..< 4) ~= 2)
        XCTAssertTrue (TJRange(2 ..< 4) ~= 3)
        XCTAssertFalse(TJRange(2 ..< 4) ~= 4)
        XCTAssertFalse(TJRange(2 ..< 4) ~= 5)
    }

    func testScalar_LOClosedRangeComparitors() {
        XCTAssertFalse(TJRange(leftOpen: 2 ... 4) ~= 1)
        XCTAssertFalse(TJRange(leftOpen: 2 ... 4) ~= 2)
        XCTAssertTrue (TJRange(leftOpen: 2 ... 4) ~= 3)
        XCTAssertTrue (TJRange(leftOpen: 2 ... 4) ~= 4)
        XCTAssertFalse(TJRange(leftOpen: 2 ... 4) ~= 5)
    }

    func testScalar_LORangeComparitors() {
        XCTAssertFalse(TJRange(leftOpen: 2 ..< 4) ~= 1)
        XCTAssertFalse(TJRange(leftOpen: 2 ..< 4) ~= 2)
        XCTAssertTrue (TJRange(leftOpen: 2 ..< 4) ~= 3)
        XCTAssertFalse(TJRange(leftOpen: 2 ..< 4) ~= 4)
        XCTAssertFalse(TJRange(leftOpen: 2 ..< 4) ~= 5)
    }

    func testScalar_PartialRangeThroughComparitors() {
        XCTAssertTrue (TJRange(...4) ~= Int.min)
        XCTAssertTrue (TJRange(...4) ~= 1)
        XCTAssertTrue (TJRange(...4) ~= 2)
        XCTAssertTrue (TJRange(...4) ~= 3)
        XCTAssertTrue (TJRange(...4) ~= 4)
        XCTAssertFalse(TJRange(...4) ~= 5)
    }

    func testScalar_PartialRangeUpToComparitors() {
        XCTAssertTrue (TJRange(..<4) ~= Int.min)
        XCTAssertTrue (TJRange(..<4) ~= 1)
        XCTAssertTrue (TJRange(..<4) ~= 2)
        XCTAssertTrue (TJRange(..<4) ~= 3)
        XCTAssertFalse(TJRange(..<4) ~= 4)
        XCTAssertFalse(TJRange(..<4) ~= 5)
    }

    func testScalar_PartialRangeFromComparitors() {
        XCTAssertFalse(TJRange(2...) ~= 1)
        XCTAssertTrue (TJRange(2...) ~= 2)
        XCTAssertTrue (TJRange(2...) ~= 3)
        XCTAssertTrue (TJRange(2...) ~= 4)
        XCTAssertTrue (TJRange(2...) ~= 5)
        XCTAssertTrue (TJRange(2...) ~= Int.max)
    }

    func testClosedRange_ClosedRangeComparitors() {
        XCTAssertFalse(TJRange(4 ... 6) ~= TJRange(1 ...  3))
        XCTAssertFalse(TJRange(4 ... 6) ~= TJRange(2 ...  4))
        XCTAssertFalse(TJRange(4 ... 6) ~= TJRange(3 ...  5))
        XCTAssertTrue (TJRange(4 ... 6) ~= TJRange(4 ...  6))
        XCTAssertFalse(TJRange(4 ... 6) ~= TJRange(5 ...  7))
        XCTAssertFalse(TJRange(4 ... 6) ~= TJRange(6 ...  8))
        XCTAssertFalse(TJRange(4 ... 6) ~= TJRange(7 ...  9))
        XCTAssertFalse(TJRange(4 ... 6) ~= TJRange(3 ...  6))
        XCTAssertFalse(TJRange(4 ... 6) ~= TJRange(3 ...  7))
        XCTAssertFalse(TJRange(4 ... 6) ~= TJRange(4 ...  7))
        XCTAssertTrue (TJRange(3 ... 7) ~= TJRange(4 ...  6))

        XCTAssertFalse(TJRange(1 ...  3) == TJRange(4 ... 6))
        XCTAssertFalse(TJRange(2 ...  4) == TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  5) == TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  6) == TJRange(4 ... 6))
        XCTAssertFalse(TJRange(5 ...  7) == TJRange(4 ... 6))
        XCTAssertFalse(TJRange(6 ...  8) == TJRange(4 ... 6))
        XCTAssertFalse(TJRange(7 ...  9) == TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  6) == TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  7) == TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  7) == TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) == TJRange(3 ... 7))
    }

    func testClosedRange_ClosedRangeSubtract() {
        XCTAssertEqual(TJRange(4 ... 7) - TJRange(5 ... 8),     [TJRange(4 ..< 5)])
        XCTAssertEqual(TJRange(4 ... 7) - TJRange(3 ... 5),     [TJRange(leftOpen:5 ... 7)])
        XCTAssertEqual(TJRange(4 ... 7) - TJRange(3 ... 8),     [])
        XCTAssertEqual(TJRange(4 ... 7) - TJRange(5 ... 6),     [TJRange(4 ..< 5), TJRange(leftOpen:6 ... 7)])
    }

    func testInfinteRange_AnyRangeSubtract() {
        XCTAssertEqual(TJRange() - TJRange(5 ... 8),            [TJRange(..<5), TJRange(leftOpen:8... as PartialRangeFrom)])
        XCTAssertEqual(TJRange() - TJRange(5 ..< 8),            [TJRange(..<5), TJRange(8... as PartialRangeFrom)])
    }

    static var allTests: [(String, (TJRangeTests) -> () -> Void)] = [
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
