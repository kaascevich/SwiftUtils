import Foundation

// MARK: - Collections

prefix operator ¡

/// Returns an array containing the non-`nil` elements of `original`.
///
/// Use this operator to trim `nil` values from an array of optionals.
///
///     let possibleNumbers = ["1", "2", "three", "///4///", "5"]
///
///     let mapped: [Int?] = possibleNumbers => { str in Int(str) }
///     // [1, 2, nil, nil, 5]
///
///     let trimmed: [Int] = !mapped
///     // [1, 2, 5]
///
/// - Parameters:
///   - original: The sequence to trim.
///
/// - Returns: An array of the non-`nil` elements of `original`.
///
/// - Complexity: O(*n*), where *n* is the length of `original`.
public extension Sequence {
    @inlinable static prefix func ¡ <T>(_ items: Self) -> [T] where Element == T? {
        items --> { $0 }
    }
}

// MARK: - Nil Checking

public extension Optional {
    /// A Boolean value indicating whether this optional is equal to `nil`.
    @inlinable var isNil: Bool { self == nil }
    
    /// A Boolean value indicating whether this optional is not equal to `nil`.
    @inlinable var isNotNil: Bool { !isNil }
}

// MARK: - Optionalization

prefix operator ¿

/// Optionalizes the given closure.
///
/// Use the ¿ operator when you need to pass an optional argument to a
/// closure that does not accept optionals. The optionalized closure will
/// immediately return `nil` if the argument is `nil`; otherwise, the
/// wrapped closure will be called normally.
///
/// The wrapped closure will not be called if the argument is `nil`.
///
///     let add42: (Int) -> Int = {
///         print("Adding 42...")
///         return $0 + 42
///     }
///     let optionalizedAdd42 = ¿add42
///
///     let threePlus42 = optionalizedAdd42(3)
///     // Prints "Adding 42..."
///     // threePlus42 == 45
///
///     let nilPlus42 = optionalizedAdd42(nil)
///     // nilPlus42 == nil
///
/// - Parameter closure: A closure to optionalize.
///
/// - Returns: A closure that returns `nil` if its parameter is `nil`.
public prefix func ¿ <T, U>(_ closure: @escaping (T) -> U) -> (T?) -> U? {
    { $0.isNil ? nil : closure($0!) }
}

// MARK: - Force Unwrapping

postfix operator ¡

public extension Optional {
    /// An error indicating that a `nil` value was unexpectedly found
    /// while unwrapping an optional.
    struct UnexpectedNilError: Error { }
    
    /// Unwraps an optional, throwing an error if `optional` is `nil`.
    ///
    /// Use the ¡ operator when you're not sure if an `Optional` instance
    /// contains a value, but you don't want to handle the case where
    /// `optional` is `nil` yourself. Using this operator on an instance of
    /// `nil` causes an `UnexpectedNilError` to be thrown.
    ///
    /// This operator differs from the forced unwrap operator (postfix `!`)
    /// in that, if a `nil` value is found, an error will be thrown using
    /// Swift's error system, rather than immediately terminating the
    /// program.
    ///
    /// - Parameter optional: An optional value to unwrap.
    ///
    /// - Returns: The wrapped value of `optional`.
    ///
    /// - Throws: `UnexpectedNilError` if `optional` is `nil`.
    static postfix func ¡ (_ optional: Wrapped?) throws -> Wrapped {
        if optional.isNil {
            throw UnexpectedNilError()
        }
        return optional!
    }
}
