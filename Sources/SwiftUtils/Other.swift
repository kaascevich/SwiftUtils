import Foundation

// MARK: - For Each

/// Calls the given closure `times` times in the same order as a
/// `for`-`in` loop.
///
/// The two loops in the following example produce the same output:
///
///     for number in 0..<3 {
///         print(number)
///     }
///     // Prints "0"
///     // Prints "1"
///     // Prints "2"
///
///     3 => { number in
///         print(number)
///     }
///     // Same as above
///
/// Using the `=>` operator is distinct from a `for`-`in` loop in two
/// important ways:
///
/// 1. You cannot use a `break` or `continue` statement to exit the current
///    call of the `body` closure or skip subsequent calls.
/// 2. Using the `return` statement in the `body` closure will exit only from
///    the current call to `body`, not from any outer scope, and won't skip
///    subsequent calls.
///
/// - Parameter times: The number of iterations to perform.
/// - Parameter body: A closure that takes a `UInt` as a parameter.
public func => (
    _ times: UInt,
    _ body: (UInt) throws -> Void
) rethrows {
    try (0..<times) => body
}

// MARK: - Ranges

extension Range: Defaultable where Bound: Defaultable {
    public static var defaultValue: Self { Bound.defaultValue..<Bound.defaultValue }
}
