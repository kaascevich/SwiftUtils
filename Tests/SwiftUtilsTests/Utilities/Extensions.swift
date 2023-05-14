import XCTest

/// Asserts that three values are equal.
///
/// Use this function to compare three non-optional values of the same type.
func XCTAssertEqual<T: Equatable>(
    _ expression1: @autoclosure @escaping () throws -> T,
    _ expression2: @autoclosure @escaping () throws -> T,
    _ expression3: @autoclosure @escaping () throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath,
    line: UInt = #line
) {
    XCTAssertEqual(try expression1(), try expression2())
    XCTAssertEqual(try expression2(), try expression3())
}
