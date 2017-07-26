import XCTest
@testable import TJBase

class TJRangeTests: XCTestCase {
    func testScalar_ClosedRangeComparitors() {
        XCTAssertTrue (1 < TJRange(2 ... 4))
        XCTAssertFalse(2 < TJRange(2 ... 4))
        XCTAssertFalse(3 < TJRange(2 ... 4))
        XCTAssertFalse(4 < TJRange(2 ... 4))
        XCTAssertFalse(5 < TJRange(2 ... 4))

        XCTAssertFalse(1 > TJRange(2 ... 4))
        XCTAssertFalse(2 > TJRange(2 ... 4))
        XCTAssertFalse(3 > TJRange(2 ... 4))
        XCTAssertFalse(4 > TJRange(2 ... 4))
        XCTAssertTrue (5 > TJRange(2 ... 4))

        XCTAssertTrue (1 != TJRange(2 ... 4))
        XCTAssertFalse(2 != TJRange(2 ... 4))
        XCTAssertFalse(3 != TJRange(2 ... 4))
        XCTAssertFalse(4 != TJRange(2 ... 4))
        XCTAssertTrue (5 != TJRange(2 ... 4))

        XCTAssertFalse(1 == TJRange(2 ... 4))
        XCTAssertTrue (2 == TJRange(2 ... 4))
        XCTAssertTrue (3 == TJRange(2 ... 4))
        XCTAssertTrue (4 == TJRange(2 ... 4))
        XCTAssertFalse(5 == TJRange(2 ... 4))
    }

    func testScalar_RangeComparitors() {
        XCTAssertTrue (1 < TJRange(2 ..< 4))
        XCTAssertFalse(2 < TJRange(2 ..< 4))
        XCTAssertFalse(3 < TJRange(2 ..< 4))
        XCTAssertFalse(4 < TJRange(2 ..< 4))
        XCTAssertFalse(5 < TJRange(2 ..< 4))

        XCTAssertFalse(1 > TJRange(2 ..< 4))
        XCTAssertFalse(2 > TJRange(2 ..< 4))
        XCTAssertFalse(3 > TJRange(2 ..< 4))
        XCTAssertTrue (4 > TJRange(2 ..< 4))
        XCTAssertTrue (5 > TJRange(2 ..< 4))

        XCTAssertTrue (1 != TJRange(2 ..< 4))
        XCTAssertFalse(2 != TJRange(2 ..< 4))
        XCTAssertFalse(3 != TJRange(2 ..< 4))
        XCTAssertTrue (4 != TJRange(2 ..< 4))
        XCTAssertTrue (5 != TJRange(2 ..< 4))

        XCTAssertFalse(1 == TJRange(2 ..< 4))
        XCTAssertTrue (2 == TJRange(2 ..< 4))
        XCTAssertTrue (3 == TJRange(2 ..< 4))
        XCTAssertFalse(4 == TJRange(2 ..< 4))
        XCTAssertFalse(5 == TJRange(2 ..< 4))
    }

    func testScalar_LOClosedRangeComparitors() {
        XCTAssertTrue (1 < TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (2 < TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(3 < TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(4 < TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(5 < TJRange(leftOpen: 2 ... 4))

        XCTAssertFalse(1 > TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(2 > TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(3 > TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(4 > TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (5 > TJRange(leftOpen: 2 ... 4))

        XCTAssertTrue (1 != TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (2 != TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(3 != TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(4 != TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (5 != TJRange(leftOpen: 2 ... 4))

        XCTAssertFalse(1 == TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(2 == TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (3 == TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (4 == TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(5 == TJRange(leftOpen: 2 ... 4))
    }

    func testScalar_LORangeComparitors() {
        XCTAssertTrue (1 < TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (2 < TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(3 < TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(4 < TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(5 < TJRange(leftOpen: 2 ..< 4))

        XCTAssertFalse(1 > TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(2 > TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(3 > TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (4 > TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (5 > TJRange(leftOpen: 2 ..< 4))

        XCTAssertTrue (1 != TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (2 != TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(3 != TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (4 != TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (5 != TJRange(leftOpen: 2 ..< 4))

        XCTAssertFalse(1 == TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(2 == TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (3 == TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(4 == TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(5 == TJRange(leftOpen: 2 ..< 4))
    }

    func testScalar_PartialRangeThroughComparitors() {
        XCTAssertFalse(Int.min < TJRange(...4))
        XCTAssertFalse(1 < TJRange(...4))
        XCTAssertFalse(2 < TJRange(...4))
        XCTAssertFalse(3 < TJRange(...4))
        XCTAssertFalse(4 < TJRange(...4))
        XCTAssertFalse(5 < TJRange(...4))

        XCTAssertFalse(Int.min > TJRange(...4))
        XCTAssertFalse(1 > TJRange(...4))
        XCTAssertFalse(2 > TJRange(...4))
        XCTAssertFalse(3 > TJRange(...4))
        XCTAssertFalse(4 > TJRange(...4))
        XCTAssertTrue (5 > TJRange(...4))

        XCTAssertFalse(Int.min != TJRange(...4))
        XCTAssertFalse(1 != TJRange(...4))
        XCTAssertFalse(2 != TJRange(...4))
        XCTAssertFalse(3 != TJRange(...4))
        XCTAssertFalse(4 != TJRange(...4))
        XCTAssertTrue (5 != TJRange(...4))

        XCTAssertTrue (Int.min == TJRange(...4))
        XCTAssertTrue (1 == TJRange(...4))
        XCTAssertTrue (2 == TJRange(...4))
        XCTAssertTrue (3 == TJRange(...4))
        XCTAssertTrue (4 == TJRange(...4))
        XCTAssertFalse(5 == TJRange(...4))
    }

    func testScalar_PartialRangeUpToComparitors() {
        XCTAssertFalse(Int.min < TJRange(..<4))
        XCTAssertFalse(1 < TJRange(..<4))
        XCTAssertFalse(2 < TJRange(..<4))
        XCTAssertFalse(3 < TJRange(..<4))
        XCTAssertFalse(4 < TJRange(..<4))
        XCTAssertFalse(5 < TJRange(..<4))

        XCTAssertFalse(Int.min > TJRange(..<4))
        XCTAssertFalse(1 > TJRange(..<4))
        XCTAssertFalse(2 > TJRange(..<4))
        XCTAssertFalse(3 > TJRange(..<4))
        XCTAssertTrue (4 > TJRange(..<4))
        XCTAssertTrue (5 > TJRange(..<4))

        XCTAssertFalse(Int.min != TJRange(..<4))
        XCTAssertFalse(1 != TJRange(..<4))
        XCTAssertFalse(2 != TJRange(..<4))
        XCTAssertFalse(3 != TJRange(..<4))
        XCTAssertTrue (4 != TJRange(..<4))
        XCTAssertTrue (5 != TJRange(..<4))

        XCTAssertTrue (Int.min == TJRange(..<4))
        XCTAssertTrue (1 == TJRange(..<4))
        XCTAssertTrue (2 == TJRange(..<4))
        XCTAssertTrue (3 == TJRange(..<4))
        XCTAssertFalse(4 == TJRange(..<4))
        XCTAssertFalse(5 == TJRange(..<4))
    }

    func testScalar_PartialRangeFromComparitors() {
        XCTAssertTrue (1 < TJRange(2...))
        XCTAssertFalse(2 < TJRange(2...))
        XCTAssertFalse(3 < TJRange(2...))
        XCTAssertFalse(4 < TJRange(2...))
        XCTAssertFalse(5 < TJRange(2...))
        XCTAssertFalse(Int.max < TJRange(2...))

        XCTAssertFalse(1 > TJRange(2...))
        XCTAssertFalse(2 > TJRange(2...))
        XCTAssertFalse(3 > TJRange(2...))
        XCTAssertFalse(4 > TJRange(2...))
        XCTAssertFalse(5 > TJRange(2...))
        XCTAssertFalse(Int.max > TJRange(2...))

        XCTAssertTrue (1 != TJRange(2...))
        XCTAssertFalse(2 != TJRange(2...))
        XCTAssertFalse(3 != TJRange(2...))
        XCTAssertFalse(4 != TJRange(2...))
        XCTAssertFalse(5 != TJRange(2...))
        XCTAssertFalse(Int.max != TJRange(2...))

        XCTAssertFalse(1 == TJRange(2...))
        XCTAssertTrue (2 == TJRange(2...))
        XCTAssertTrue (3 == TJRange(2...))
        XCTAssertTrue (4 == TJRange(2...))
        XCTAssertTrue (5 == TJRange(2...))
        XCTAssertTrue (Int.max == TJRange(2...))
    }

    func testClosedRange_ClosedRangeComparitors() {
        XCTAssertTrue (TJRange(1 ... 3) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(2 ... 4) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ... 5) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ... 6) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(5 ... 7) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(6 ... 8) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(7 ... 9) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ... 6) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ... 7) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ... 7) << TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ... 6) << TJRange(3 ... 7))

        XCTAssertFalse(TJRange(1 ...  3) >> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(2 ...  4) >> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  5) >> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) >> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(5 ...  7) >> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(6 ...  8) >> TJRange(4 ... 6))
        XCTAssertTrue (TJRange(7 ...  9) >> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  6) >> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  7) >> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  7) >> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) >> TJRange(3 ... 7))

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
        XCTAssertTrue (TJRange(4 ...  6) == TJRange(3 ... 7))

        XCTAssertTrue (TJRange(1 ...  3) != TJRange(4 ... 6))
        XCTAssertFalse(TJRange(2 ...  4) != TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  5) != TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) != TJRange(4 ... 6))
        XCTAssertFalse(TJRange(5 ...  7) != TJRange(4 ... 6))
        XCTAssertFalse(TJRange(6 ...  8) != TJRange(4 ... 6))
        XCTAssertTrue (TJRange(7 ...  9) != TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  6) != TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  7) != TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  7) != TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) != TJRange(3 ... 7))

        XCTAssertFalse(TJRange(1 ...  3) === TJRange(4 ... 6))
        XCTAssertFalse(TJRange(2 ...  4) === TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  5) === TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  6) === TJRange(4 ... 6))
        XCTAssertFalse(TJRange(5 ...  7) === TJRange(4 ... 6))
        XCTAssertFalse(TJRange(6 ...  8) === TJRange(4 ... 6))
        XCTAssertFalse(TJRange(7 ...  9) === TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  6) === TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  7) === TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  7) === TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) === TJRange(3 ... 7))

        XCTAssertTrue (TJRange(1 ...  3) !== TJRange(4 ... 6))
        XCTAssertTrue (TJRange(2 ...  4) !== TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  5) !== TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) !== TJRange(4 ... 6))
        XCTAssertTrue (TJRange(5 ...  7) !== TJRange(4 ... 6))
        XCTAssertTrue (TJRange(6 ...  8) !== TJRange(4 ... 6))
        XCTAssertTrue (TJRange(7 ...  9) !== TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  6) !== TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  7) !== TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  7) !== TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  6) !== TJRange(3 ... 7))

        XCTAssertFalse(TJRange(1 ...  3) <> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(2 ...  4) <> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  5) <> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) <> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(5 ...  7) <> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(6 ...  8) <> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(7 ...  9) <> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  6) <> TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  7) <> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  7) <> TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) <> TJRange(3 ... 7))

        XCTAssertFalse(TJRange(1 ...  3) ≤≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(2 ...  4) ≤≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  5) ≤≥ TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  6) ≤≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(5 ...  7) ≤≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(6 ...  8) ≤≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(7 ...  9) ≤≥ TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  6) ≤≥ TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  7) ≤≥ TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  7) ≤≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) ≤≥ TJRange(3 ... 7))

        XCTAssertFalse(TJRange(1 ...  3) <= TJRange(4 ... 6))
        XCTAssertTrue (TJRange(2 ...  4) <= TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  5) <= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) <= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(5 ...  7) <= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(6 ...  8) <= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(7 ...  9) <= TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  6) <= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  7) <= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  7) <= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) <= TJRange(3 ... 7))

        XCTAssertFalse(TJRange(1 ...  3) ≤= TJRange(4 ... 6))
        XCTAssertTrue (TJRange(2 ...  4) ≤= TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  5) ≤= TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  6) ≤= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(5 ...  7) ≤= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(6 ...  8) ≤= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(7 ...  9) ≤= TJRange(4 ... 6))
        XCTAssertTrue (TJRange(3 ...  6) ≤= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  7) ≤= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  7) ≤= TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) ≤= TJRange(3 ... 7))

        XCTAssertFalse(TJRange(1 ...  3) => TJRange(4 ... 6))
        XCTAssertFalse(TJRange(2 ...  4) => TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  5) => TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) => TJRange(4 ... 6))
        XCTAssertTrue (TJRange(5 ...  7) => TJRange(4 ... 6))
        XCTAssertTrue (TJRange(6 ...  8) => TJRange(4 ... 6))
        XCTAssertFalse(TJRange(7 ...  9) => TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  6) => TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  7) => TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  7) => TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) => TJRange(3 ... 7))

        XCTAssertFalse(TJRange(1 ...  3) =≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(2 ...  4) =≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  5) =≥ TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  6) =≥ TJRange(4 ... 6))
        XCTAssertTrue (TJRange(5 ...  7) =≥ TJRange(4 ... 6))
        XCTAssertTrue (TJRange(6 ...  8) =≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(7 ...  9) =≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  6) =≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(3 ...  7) =≥ TJRange(4 ... 6))
        XCTAssertTrue (TJRange(4 ...  7) =≥ TJRange(4 ... 6))
        XCTAssertFalse(TJRange(4 ...  6) =≥ TJRange(3 ... 7))
    }

    func testClosedRange_ClosedRangeSubtract() {
        XCTAssertEqual(
            TJRangeSet(TJRange(4 ... 7) - TJRange(5 ... 8)),
            TJRangeSet([TJRange(4 ..< 5)])
        )

        XCTAssertEqual(
            TJRangeSet(TJRange(4 ... 7) - TJRange(3 ... 5)),
            TJRangeSet([TJRange(leftOpen:5 ... 7)])
        )

        XCTAssertEqual(
            TJRangeSet(TJRange(4 ... 7) - TJRange(3 ... 8)),
            TJRangeSet()
        )

        XCTAssertEqual(
            TJRangeSet(TJRange(4 ... 7) - TJRange(5 ... 6)),
            TJRangeSet([TJRange(4 ..< 5), TJRange(leftOpen:6 ... 7)])
        )
    }

    func testInfinteRange_AnyRangeSubtract() {
        XCTAssertEqual(
            TJRangeSet(TJRange() - TJRange(5 ... 8)),
            TJRangeSet([TJRange(..<5), TJRange(leftOpen:8... as PartialRangeFrom)])
        )

        XCTAssertEqual(
            TJRangeSet(TJRange() - TJRange(5 ..< 8)),
            TJRangeSet([TJRange(..<5), TJRange(8... as PartialRangeFrom)])
        )
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
