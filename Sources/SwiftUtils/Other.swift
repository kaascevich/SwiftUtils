import Foundation

// MARK: - For Each

/// Calls the given closure a specified number of times, passing it the
/// current loop count (starting from 0).
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
/// - Parameter loopCount: The number of iterations to perform.
/// - Parameter body: A closure that takes an `Int` as a parameter.
@inlinable public func => (
    _ loopCount: Int,
    _ body: (Int) throws -> Void
) rethrows {
    precondition(loopCount >= 0, "cannot iterate over a negative interval")
    try 0..<loopCount => body
}

/// Calls the given closure a specified number of times.
///
/// The two loops in the following example produce the same output:
///
///     for _ in 0..<3 {
///         print("Swift")
///     }
///     // Prints "Swift"
///     // Prints "Swift"
///     // Prints "Swift"
///
///     3 => {
///         print("Swift")
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
/// - Parameter loopCount: The number of iterations to perform.
/// - Parameter body: A closure that does not take any parameters.
@inlinable public func => (
    _ loopCount: Int,
    _ body: () throws -> Void
) rethrows {
    try loopCount => { _ in try body() }
}

// MARK: - Ranges

extension Range: Defaultable where Bound: Defaultable {
    public static var defaultValue: Self { Bound.defaultValue..<Bound.defaultValue }
}
