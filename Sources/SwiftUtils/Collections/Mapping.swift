import Foundation

// MARK: - Mapping

infix operator ==>: ForEachPrecedence

public extension Sequence {
    /// Returns an array containing the results of mapping the given closure
    /// over the sequence's elements.
    ///
    /// In this example, `=>` is used first to convert the names in the array
    /// to lowercase strings and then to count their characters.
    ///
    ///     let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    ///     let lowercaseNames = cast ==> { $0.lowercased() }
    ///     // 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
    ///     let letterCounts = cast ==> \.count
    ///     // 'letterCounts' == [6, 6, 3, 4]
    ///
    /// - Parameters:
    ///   - original: The sequence to transform.
    ///   - transform: A mapping closure. `transform` accepts an
    ///     element of `original` as its parameter and returns a transformed
    ///     value of the same or of a different type.
    ///     
    /// - Returns: An array containing the transformed elements of `original`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of `original`.
    @inlinable @discardableResult static func ==> <ElementOfResult>(
        _ original: Self,
        _ transform: (Element) throws -> ElementOfResult
    ) rethrows -> [ElementOfResult] {
        try original.map(transform)
    }
}

// MARK: - Compact Mapping

infix operator -->: ForEachPrecedence

public extension Sequence {
    /// Returns an array containing the non-`nil` results of calling the given
    /// transformation with each element of `original`.
    ///
    /// Use this operator to receive an array of non-optional values when your
    /// transformation produces an optional value.
    ///
    /// In this example, note the difference in the result of using `==>` and
    /// `-->` with a transformation that returns an optional `Int` value.
    ///
    ///     let possibleNumbers = ["1", "2", "three", "///4///", "5"]
    ///
    ///     let mapped: [Int?] = possibleNumbers ==> { str in Int(str) }
    ///     // [1, 2, nil, nil, 5]
    ///
    ///     let compactMapped: [Int] = possibleNumbers --> { str in Int(str) }
    ///     // [1, 2, 5]
    ///
    /// - Parameters:
    ///   - original: The sequence to transform.
    ///   - transform: A closure that accepts an element of `original` as its
    ///     argument and returns an optional value.
    ///
    /// - Returns: An array of the non-`nil` results of calling `transform`
    ///   with each element of `original`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of `original`.
    @inlinable @discardableResult static func --> <ElementOfResult>(
        _ original: Self,
        _ transform: (Element) throws -> ElementOfResult?
    ) rethrows -> [ElementOfResult] {
        try original.compactMap(transform)
    }
}
