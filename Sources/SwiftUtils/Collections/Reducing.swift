import Foundation

// MARK: - Reducing

infix operator |>>: ForEachPrecedence

public extension Sequence {
    /// Returns the result of combining the elements of `original` using the
    /// given closure, using the result type's default value as the initial
    /// result.
    ///
    /// Use the `|>>` operator to produce a single value from the elements
    /// of an entire sequence. For example, you can use this operator on an
    /// array of numbers to find their sum or product.
    ///
    /// The `nextPartialResult` closure is called sequentially with an
    /// accumulating value initialized to `Result.defaultValue` and each
    /// element of `original`. This example shows how to find the sum of
    /// an array of numbers.
    ///
    ///     let numbers = [1, 2, 3, 4]
    ///     let numberSum = numbers |>> { x, y in
    ///         x + y
    ///     }
    ///     // numberSum == 10
    ///
    /// When `|>>` is called, the following steps occur:
    ///
    /// 1. The `nextPartialResult` closure is called with `Result.defaultValue`
    ///    ---`0` in this case---and the first element of `numbers`, returning
    ///    the sum: `1`.
    /// 2. The closure is called again repeatedly with the previous call's return
    ///    value and each element of `original`.
    /// 3. When `original` is exhausted, the last value returned from the
    ///    closure is returned to the caller.
    ///
    /// If `original` has no elements, `nextPartialResult` is never executed
    /// and `Result.defaultValue` is the result of the call to `reduce(_:_:)`.
    ///
    /// - Parameters:
    ///   - original: The sequence to reduce.
    ///   - nextPartialResult: A closure that combines an accumulating value and
    ///     an element of `original` into a new accumulating value, to be used
    ///     in the next call of the `nextPartialResult` closure or returned to
    ///     the caller.
    /// - Returns: The final accumulated value. If `original` has no elements,
    ///   the result is `Result.defaultValue`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of `original`.
    @inlinable static func |>> <Result>(
        _ original: Self,
        nextPartialResult: @escaping (Result, Element) -> Result
    ) -> Result where Result: Defaultable {
        original.reduce(Result.defaultValue, nextPartialResult)
    }
}
