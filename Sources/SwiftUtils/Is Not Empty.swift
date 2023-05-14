import Foundation

// MARK: - Collections

public extension Collection {
    /// A Boolean value indicating whether the collection is not empty.
    ///
    /// When you need to check whether your collection is not empty, use the
    /// `isNotEmpty` property instead of checking that the `count` property
    /// is not equal to zero. For collections that don't conform to
    /// `RandomAccessCollection`, accessing the `count` property iterates
    /// through the elements of the collection.
    ///
    ///     let horseName = "Silver"
    ///     if horseName.isNotEmpty {
    ///         print("Hi ho, \(horseName)!")
    ///     } else {
    ///         print("My horse has no name.")
    ///     }
    ///     // Prints "Hi ho, Silver!"
    ///
    /// - Complexity: O(1)
    @inlinable var isNotEmpty: Bool { !isEmpty }
}

// MARK: - Strings

public extension String {
    /// A Boolean value indicating whether a string has characters.
    @inlinable var isNotEmpty: Bool { !isEmpty }
}

// MARK: - Ranges

public extension Range {
    /// A Boolean value indicating whether the range contains no elements.
    ///
    /// An empty `Range` instance has equal lower and upper bounds.
    ///
    ///     let empty: Range = 10..<10
    ///     print(empty.isNotEmpty)
    ///     // Prints "false"
    @inlinable var isNotEmpty: Bool { !isEmpty }
}

// MARK: - Closed Ranges

public extension ClosedRange {
    /// A Boolean value indicating whether the range contains no elements.
    ///
    /// Because a closed range cannot represent an empty range, this
    /// property is always `true`.
    @inlinable var isNotEmpty: Bool { !isEmpty }
}

// MARK: - Dictionaries

public extension Dictionary {
    /// A Boolean value that indicates whether the dictionary is empty.
    ///
    /// Dictionaries are empty when created with an initializer or an
    /// empty dictionary literal.
    ///
    ///     var frequencies: [String: Int] = [:]
    ///     print(frequencies.isNotEmpty)
    ///     // Prints "false"
    @inlinable var isNotEmpty: Bool { !isEmpty }
}
