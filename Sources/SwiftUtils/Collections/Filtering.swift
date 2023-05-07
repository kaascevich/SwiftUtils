import Foundation

// MARK: - Filtering

infix operator |>: ForEachPrecedence

public extension Sequence {
    /// Returns an array containing, in order, the elements of `original`
    /// that satisfy the given predicate.
    ///
    /// In this example, `|>` is used to include only names shorter than
    /// five characters.
    ///
    ///     let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    ///     let shortNames = cast |> { $0.count < 5 }
    ///     print(shortNames)
    ///     // Prints "["Kim", "Karl"]"
    ///
    /// - Parameters:
    ///   - original: The sequence to filter.
    ///   - isIncluded: A closure that takes an element of
    ///     `original` as its argument and returns a Boolean value indicating
    ///     whether the element should be included in the returned array.
    ///
    /// - Returns: An array of the elements that `isIncluded` allowed.
    ///
    /// - Complexity: O(*n*), where *n* is the length of `original`.
    @inlinable static func |> (
        _ original: Self,
        _ isIncluded: (Element) throws -> Bool
    ) rethrows -> [Element] {
        try original.filter(isIncluded)
    }
}
