import Foundation

// MARK: - Types

/// Prints the dynamic type of a value.
///
/// You can use the `printType(of:)` function to print the dynamic type of a
/// value, particularly when the dynamic type is different from the static type.
/// The *static type* of a value is the known, compile-time type of the value.
/// The *dynamic type* of a value is the value's actual type at run-time, which
/// can be a subtype of its concrete type.
///
/// In the following code, the `count` variable has the same static and dynamic
/// type: `Int`. When `count` is passed to the `printType(of:)` function,
/// however, the `value` parameter has a static type of `Any` (the type
/// declared for the parameter) and a dynamic type of `Int`.
///
///     let count: Int = 5
///     printType(of: count)
///     // Prints "Int"
///
/// The dynamic type printed by `printType(of:)` is a *concrete metatype*
/// (`T.Type`) for a class, structure, enumeration, or other nonprotocol type
/// `T`, or an *existential metatype* (`P.Type`) for a protocol or protocol
/// composition `P`.
///
/// - Parameter value: The value for which to print the dynamic type.
public func printType(of value: Any) {
    print(type(of: value))
}
