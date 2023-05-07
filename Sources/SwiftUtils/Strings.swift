import Foundation

prefix operator §

/// Creates a string representing the given value.
///
/// Use the `§` operator to convert an instance of any type to its preferred
/// representation as a `String` instance. The `§` operator creates the
/// string representation of `instance` in one of the following ways,
/// depending on its protocol conformance:
///
/// - If `instance` conforms to the `TextOutputStreamable` protocol, the
///   result is obtained by calling `instance.write(to: s)` on an empty
///   string `s`.
/// - If `instance` conforms to the `CustomStringConvertible` protocol, the
///   result is `instance.description`.
/// - If `instance` conforms to the `CustomDebugStringConvertible` protocol,
///   the result is `instance.debugDescription`.
/// - An unspecified result is supplied automatically by the Swift standard
///   library.
///
/// For example, this custom `Point` struct uses the default representation
/// supplied by the standard library.
///
///     struct Point {
///         let x: Int, y: Int
///     }
///
///     let p = Point(x: 21, y: 30)
///     print(§p)
///     // Prints "Point(x: 21, y: 30)"
///
/// After adding `CustomStringConvertible` conformance by implementing the
/// `description` property, `Point` provides its own custom representation.
///
///     extension Point: CustomStringConvertible {
///         var description: String {
///             return "(\(x), \(y))"
///         }
///     }
///
///     print(§p)
///     // Prints "(21, 30)"
@inlinable public prefix func § (_ instance: Any) -> String {
    String(describing: instance)
}
