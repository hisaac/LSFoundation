import XCTest
@testable import LSFoundation

final class LSFoundationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LSFoundation().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
