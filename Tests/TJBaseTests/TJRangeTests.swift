import XCTest
@testable import TJBase

class TJRangeTests: XCTestCase {
    func testScalarClosedRangeComparitors() {
        XCTAssertTrue (1 << TJRange(2 ... 4))
        XCTAssertFalse(2 << TJRange(2 ... 4))
        XCTAssertFalse(3 << TJRange(2 ... 4))
        XCTAssertFalse(4 << TJRange(2 ... 4))
        XCTAssertFalse(5 << TJRange(2 ... 4))

        XCTAssertFalse(1 >> TJRange(2 ... 4))
        XCTAssertFalse(2 >> TJRange(2 ... 4))
        XCTAssertFalse(3 >> TJRange(2 ... 4))
        XCTAssertFalse(4 >> TJRange(2 ... 4))
        XCTAssertTrue (5 >> TJRange(2 ... 4))

        XCTAssertTrue (1 >< TJRange(2 ... 4))
        XCTAssertFalse(2 >< TJRange(2 ... 4))
        XCTAssertFalse(3 >< TJRange(2 ... 4))
        XCTAssertFalse(4 >< TJRange(2 ... 4))
        XCTAssertTrue (5 >< TJRange(2 ... 4))

        XCTAssertFalse(1 ~~ TJRange(2 ... 4))
        XCTAssertTrue (2 ~~ TJRange(2 ... 4))
        XCTAssertTrue (3 ~~ TJRange(2 ... 4))
        XCTAssertTrue (4 ~~ TJRange(2 ... 4))
        XCTAssertFalse(5 ~~ TJRange(2 ... 4))
    }

    func testScalarRangeComparitors() {
        XCTAssertTrue (1 << TJRange(2 ..< 4))
        XCTAssertFalse(2 << TJRange(2 ..< 4))
        XCTAssertFalse(3 << TJRange(2 ..< 4))
        XCTAssertFalse(4 << TJRange(2 ..< 4))
        XCTAssertFalse(5 << TJRange(2 ..< 4))

        XCTAssertFalse(1 >> TJRange(2 ..< 4))
        XCTAssertFalse(2 >> TJRange(2 ..< 4))
        XCTAssertFalse(3 >> TJRange(2 ..< 4))
        XCTAssertTrue (4 >> TJRange(2 ..< 4))
        XCTAssertTrue (5 >> TJRange(2 ..< 4))

        XCTAssertTrue (1 >< TJRange(2 ..< 4))
        XCTAssertFalse(2 >< TJRange(2 ..< 4))
        XCTAssertFalse(3 >< TJRange(2 ..< 4))
        XCTAssertTrue (4 >< TJRange(2 ..< 4))
        XCTAssertTrue (5 >< TJRange(2 ..< 4))

        XCTAssertFalse(1 ~~ TJRange(2 ..< 4))
        XCTAssertTrue (2 ~~ TJRange(2 ..< 4))
        XCTAssertTrue (3 ~~ TJRange(2 ..< 4))
        XCTAssertFalse(4 ~~ TJRange(2 ..< 4))
        XCTAssertFalse(5 ~~ TJRange(2 ..< 4))
    }

    func testScalarLOClosedRangeComparitors() {
        XCTAssertTrue (1 << TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (2 << TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(3 << TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(4 << TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(5 << TJRange(leftOpen: 2 ... 4))

        XCTAssertFalse(1 >> TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(2 >> TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(3 >> TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(4 >> TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (5 >> TJRange(leftOpen: 2 ... 4))

        XCTAssertTrue (1 >< TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (2 >< TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(3 >< TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(4 >< TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (5 >< TJRange(leftOpen: 2 ... 4))

        XCTAssertFalse(1 ~~ TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(2 ~~ TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (3 ~~ TJRange(leftOpen: 2 ... 4))
        XCTAssertTrue (4 ~~ TJRange(leftOpen: 2 ... 4))
        XCTAssertFalse(5 ~~ TJRange(leftOpen: 2 ... 4))
    }

    func testScalarLORangeComparitors() {
        XCTAssertTrue (1 << TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (2 << TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(3 << TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(4 << TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(5 << TJRange(leftOpen: 2 ..< 4))

        XCTAssertFalse(1 >> TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(2 >> TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(3 >> TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (4 >> TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (5 >> TJRange(leftOpen: 2 ..< 4))

        XCTAssertTrue (1 >< TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (2 >< TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(3 >< TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (4 >< TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (5 >< TJRange(leftOpen: 2 ..< 4))

        XCTAssertFalse(1 ~~ TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(2 ~~ TJRange(leftOpen: 2 ..< 4))
        XCTAssertTrue (3 ~~ TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(4 ~~ TJRange(leftOpen: 2 ..< 4))
        XCTAssertFalse(5 ~~ TJRange(leftOpen: 2 ..< 4))
    }

    func testScalarPartialRangeThroughComparitors() {
        XCTAssertFalse(Int.min << TJRange(...4))
        XCTAssertFalse(1 << TJRange(...4))
        XCTAssertFalse(2 << TJRange(...4))
        XCTAssertFalse(3 << TJRange(...4))
        XCTAssertFalse(4 << TJRange(...4))
        XCTAssertFalse(5 << TJRange(...4))

        XCTAssertFalse(Int.min >> TJRange(...4))
        XCTAssertFalse(1 >> TJRange(...4))
        XCTAssertFalse(2 >> TJRange(...4))
        XCTAssertFalse(3 >> TJRange(...4))
        XCTAssertFalse(4 >> TJRange(...4))
        XCTAssertTrue (5 >> TJRange(...4))

        XCTAssertFalse(Int.min >< TJRange(...4))
        XCTAssertFalse(1 >< TJRange(...4))
        XCTAssertFalse(2 >< TJRange(...4))
        XCTAssertFalse(3 >< TJRange(...4))
        XCTAssertFalse(4 >< TJRange(...4))
        XCTAssertTrue (5 >< TJRange(...4))

        XCTAssertTrue (Int.min ~~ TJRange(...4))
        XCTAssertTrue (1 ~~ TJRange(...4))
        XCTAssertTrue (2 ~~ TJRange(...4))
        XCTAssertTrue (3 ~~ TJRange(...4))
        XCTAssertTrue (4 ~~ TJRange(...4))
        XCTAssertFalse(5 ~~ TJRange(...4))
    }

    func testScalarPartialRangeUpToComparitors() {
        XCTAssertFalse(Int.min << TJRange(..<4))
        XCTAssertFalse(1 << TJRange(..<4))
        XCTAssertFalse(2 << TJRange(..<4))
        XCTAssertFalse(3 << TJRange(..<4))
        XCTAssertFalse(4 << TJRange(..<4))
        XCTAssertFalse(5 << TJRange(..<4))

        XCTAssertFalse(Int.min >> TJRange(..<4))
        XCTAssertFalse(1 >> TJRange(..<4))
        XCTAssertFalse(2 >> TJRange(..<4))
        XCTAssertFalse(3 >> TJRange(..<4))
        XCTAssertTrue (4 >> TJRange(..<4))
        XCTAssertTrue (5 >> TJRange(..<4))

        XCTAssertFalse(Int.min >< TJRange(..<4))
        XCTAssertFalse(1 >< TJRange(..<4))
        XCTAssertFalse(2 >< TJRange(..<4))
        XCTAssertFalse(3 >< TJRange(..<4))
        XCTAssertTrue (4 >< TJRange(..<4))
        XCTAssertTrue (5 >< TJRange(..<4))

        XCTAssertTrue (Int.min ~~ TJRange(..<4))
        XCTAssertTrue (1 ~~ TJRange(..<4))
        XCTAssertTrue (2 ~~ TJRange(..<4))
        XCTAssertTrue (3 ~~ TJRange(..<4))
        XCTAssertFalse(4 ~~ TJRange(..<4))
        XCTAssertFalse(5 ~~ TJRange(..<4))
    }

    func testScalarPartialRangeFromComparitors() {
        XCTAssertTrue (1 << TJRange(2...))
        XCTAssertFalse(2 << TJRange(2...))
        XCTAssertFalse(3 << TJRange(2...))
        XCTAssertFalse(4 << TJRange(2...))
        XCTAssertFalse(5 << TJRange(2...))
        XCTAssertFalse(Int.max << TJRange(2...))

        XCTAssertFalse(1 >> TJRange(2...))
        XCTAssertFalse(2 >> TJRange(2...))
        XCTAssertFalse(3 >> TJRange(2...))
        XCTAssertFalse(4 >> TJRange(2...))
        XCTAssertFalse(5 >> TJRange(2...))
        XCTAssertFalse(Int.max >> TJRange(2...))

        XCTAssertTrue (1 >< TJRange(2...))
        XCTAssertFalse(2 >< TJRange(2...))
        XCTAssertFalse(3 >< TJRange(2...))
        XCTAssertFalse(4 >< TJRange(2...))
        XCTAssertFalse(5 >< TJRange(2...))
        XCTAssertFalse(Int.max >< TJRange(2...))

        XCTAssertFalse(1 ~~ TJRange(2...))
        XCTAssertTrue (2 ~~ TJRange(2...))
        XCTAssertTrue (3 ~~ TJRange(2...))
        XCTAssertTrue (4 ~~ TJRange(2...))
        XCTAssertTrue (5 ~~ TJRange(2...))
        XCTAssertTrue (Int.max ~~ TJRange(2...))
    }


    static var allTests: [(String, (TJRangeTests) -> () -> Void)] = [
        ("testScalarClosedRangeComparitors", testScalarClosedRangeComparitors),
        ("testScalarRangeComparitors", testScalarRangeComparitors),
        ("testScalarLOClosedRangeComparitors", testScalarLOClosedRangeComparitors),
        ("testScalarLORangeComparitors", testScalarLORangeComparitors),
        ("testScalarPartialRangeThroughComparitors", testScalarPartialRangeThroughComparitors),
        ("testScalarPartialRangeUpToComparitors", testScalarPartialRangeUpToComparitors),
        ("testScalarPartialRangeFromComparitors", testScalarPartialRangeFromComparitors),
    ]
}
