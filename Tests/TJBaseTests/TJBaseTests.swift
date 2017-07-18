import XCTest
@testable import TJBase

class TJBaseTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TJBase().text, "Hello, World!")
    }


    static var allTests: [(String, (TJBaseTests) -> () -> Void)] = [
        ("testExample", testExample),
    ]
}
