import Foundation

// MARK: - For Each

infix operator =>: ForEachPrecedence

public extension Sequence {
    /// Calls the given closure on each element in `sequence` in the same order
    /// as a `for`-`in` loop.
    ///
    /// The two loops in the following example produce the same output:
    ///
    ///     let numberWords = ["one", "two", "three"]
    ///     for word in numberWords {
    ///         print(word)
    ///     }
    ///     // Prints "one"
    ///     // Prints "two"
    ///     // Prints "three"
    ///
    ///     numberWords => { word in
    ///         print(word)
    ///     }
    ///     // Same as above
    ///
    /// Using the for-each (`=>`) operator is distinct from a `for`-`in` loop in
    /// two important ways:S
    ///
    /// 1. You cannot use a `break` or `continue` statement to exit the current
    ///    call of the `body` closure or skip subsequent calls.
    /// 2. Using the `return` statement in the `body` closure will exit only from
    ///    the current call to `body`, not from any outer scope, and won't skip
    ///    subsequent calls.
    ///
    /// - Parameters:
    ///   - sequence: The sequence to iterate over.
    ///   - body: A closure that takes an element of `sequence` as a
    ///     parameter.
    @inlinable static func => (
        _ sequence: Self,
        _ body: (Element) throws -> Void
    ) rethrows {
        try sequence.forEach(body)
    }
    
    /// Calls the given closure on each element in `sequence` in the same order
    /// as a `for`-`in` loop.
    ///
    /// The two loops in the following example produce the same output:
    ///
    ///     let numberWords = ["one", "two", "three"]
    ///     for (index, word) in numberWords.enumerated() {
    ///         print("\(word): \(index)")
    ///     }
    ///     // Prints "one: 1"
    ///     // Prints "two: 2"
    ///     // Prints "three: 3"
    ///
    ///     numberWords => { index, word in
    ///         print("\(word): \(index)")
    ///     }
    ///     // Same as above
    ///
    /// Using the for-each (`=>`) operator is distinct from a `for`-`in` loop in
    /// two important ways:
    ///
    /// 1. You cannot use a `break` or `continue` statement to exit the current
    ///    call of the `body` closure or skip subsequent calls.
    /// 2. Using the `return` statement in the `body` closure will exit only from
    ///    the current call to `body`, not from any outer scope, and won't skip
    ///    subsequent calls.
    ///
    /// - Parameters:
    ///   - sequence: The sequence to iterate over.
    ///   - body: A closure that takes an element of `sequence` and the current
    ///     loop index as parameters.
    @inlinable static func => (
        _ sequence: Self,
        _ body: (Int, Element) throws -> Void
    ) rethrows {
        try sequence.enumerated() => body
    }
}

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
/// Using the for-each (`=>`) operator is distinct from a `for`-`in` loop in
/// two important ways:
///
/// 1. You cannot use a `break` or `continue` statement to exit the current
///    call of the `body` closure or skip subsequent calls.
/// 2. Using the `return` statement in the `body` closure will exit only from
///    the current call to `body`, not from any outer scope, and won't skip
///    subsequent calls.
///
/// - Parameters:
///   - loopCount: The number of iterations to perform.
///   - body: A closure that takes an `Int` as a parameter.
///
/// - Requires: `loopCount >= 0`.
public func => (
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
/// Using the for-each (`=>`) operator is distinct from a `for`-`in` loop in
/// two important ways:
///
/// 1. You cannot use a `break` or `continue` statement to exit the current
///    call of the `body` closure or skip subsequent calls.
/// 2. Using the `return` statement in the `body` closure will exit only from
///    the current call to `body`, not from any outer scope, and won't skip
///    subsequent calls.
///
/// - Parameters:
///   - loopCount: The number of iterations to perform.
///   - body: A closure that does not take any parameters.
///
/// - Requires: `loopCount >= 0`.
@inlinable public func => (
    _ loopCount: Int,
    _ body: () throws -> Void
) rethrows {
    try loopCount => { _ in try body() }
}

/// Executes the given statement a specified number of times.
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
///     3 => print("Swift")
///     // Same as above
///
/// Using the for-each (`=>`) operator is distinct from a `for`-`in` loop in
/// two important ways:
///
/// 1. You cannot use a `break` or `continue` statement to exit the current
///    call of the `body` closure or skip subsequent calls.
/// 2. Using the `return` statement in the `body` closure will exit only from
///    the current call to `body`, not from any outer scope, and won't skip
///    subsequent calls.
///
/// This overload of the for-each (`=>`) operator utilizes an autoclosure to
/// allow for more concise syntax at the call site.
///
/// - Parameters:
///   - loopCount: The number of iterations to perform.
///   - body: The statement to execute on each iteration.
///
/// - Requires: `loopCount >= 0`.
@inlinable public func => (
    _ loopCount: Int,
    _ body: @autoclosure () throws -> Void
) rethrows {
    try loopCount => body
}
