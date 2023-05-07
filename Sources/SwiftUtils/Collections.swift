import Foundation

// MARK: - Empty Values

public extension Collection {
    /// A Boolean value indicating whether the collection is not empty.
    var isNotEmpty: Bool {
        !isEmpty
    }
}

// MARK: - Mapping

public extension Sequence {
    /// Returns an array containing the results of mapping the given closure
    /// over the sequence's elements.
    ///
    /// In this example, `=>` is used first to convert the names in the array
    /// to lowercase strings and then to count their characters.
    ///
    ///     let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    ///     let lowercaseNames = cast => { $0.lowercased() }
    ///     // 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
    ///     let letterCounts = cast => \.count
    ///     // 'letterCounts' == [6, 6, 3, 4]
    ///
    /// - Parameter original: The sequence to map.
    /// - Parameter transform: A mapping closure. `transform` accepts an
    ///   element of `original` as its parameter and returns a transformed
    ///   value of the same or of a different type.
    /// - Returns: An array containing the transformed elements of `original`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of `original`.
    @discardableResult static func ==> <T>(
        _ original: Self,
        _ transform: (Element) throws -> T
    ) rethrows -> [T] {
        try original.map(transform)
    }
    
    /// Returns an array containing the non-`nil` results of calling the given
    /// transformation with each element of `original`.
    ///
    /// Use this operator to receive an array of non-optional values when your
    /// transformation produces an optional value.
    ///
    /// In this example, note the difference in the result of using `=>` and
    /// `==>` with a transformation that returns an optional `Int` value.
    ///
    ///     let possibleNumbers = ["1", "2", "three", "///4///", "5"]
    ///
    ///     let mapped: [Int?] = possibleNumbers => { str in Int(str) }
    ///     // [1, 2, nil, nil, 5]
    ///
    ///     let compactMapped: [Int] = possibleNumbers ==> { str in Int(str) }
    ///     // [1, 2, 5]
    ///
    /// - Parameter transform: A closure that accepts an element of
    ///   `original` as its argument and returns an optional value.
    /// - Returns: An array of the non-`nil` results of calling `transform`
    ///   with each element of `original`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of `original`.
    @discardableResult static func --> <ElementOfResult>(
        _ original: Self,
        _ transform: (Element) throws -> ElementOfResult?
    ) rethrows -> [ElementOfResult] {
        try original.compactMap(transform)
    }
}

// MARK: - Filtering

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
    /// - Parameter original: The sequence to filter.
    /// - Parameter isIncluded: A closure that takes an element of
    ///   `original` as its argument and returns a Boolean value indicating
    ///   whether the element should be included in the returned array.
    /// - Returns: An array of the elements that `isIncluded` allowed.
    ///
    /// - Complexity: O(*n*), where *n* is the length of `original`.
    static func |> (
        _ original: Self,
        _ isIncluded: (Element) throws -> Bool
    ) rethrows -> [Element] {
        try original.filter(isIncluded)
    }
}

// MARK: - Reducing

public extension Sequence {
    /// Returns the result of combining the elements of `original` using the
    /// given closure.
    ///
    /// Use the `|>>` operator to produce a single value from the elements
    /// of an entire sequence. For example, you can use this operator on an array
    /// of numbers to find their sum or product.
    ///
    /// The `nextPartialResult` closure is called sequentially with an
    /// accumulating value initialized to `initialResult` and each element of
    /// `original`. This example shows how to find the sum of an array of
    /// numbers.
    ///
    ///     let numbers = [1, 2, 3, 4]
    ///     let numberSum = numbers |>> (0, { x, y in
    ///         x + y
    ///     })
    ///     // numberSum == 10
    ///
    /// When `|>>` is called, the following steps occur:
    ///
    /// 1. The `nextPartialResult` closure is called with `initialResult`---`0`
    ///    in this case---and the first element of `numbers`, returning the sum:
    ///    `1`.
    /// 2. The closure is called again repeatedly with the previous call's return
    ///    value and each element of `original`.
    /// 3. When `original` is exhausted, the last value returned from the
    ///    closure is returned to the caller.
    ///
    /// If `original` has no elements, `nextPartialResult` is never executed
    /// and `initialResult` is the result of the call to `reduce(_:_:)`.
    ///
    /// - Parameters:
    ///   - original: The sequence to reduce.
    ///   - initialResult: The value to use as the initial accumulating value.
    ///     `initialResult` is passed to `nextPartialResult` the first time the
    ///     closure is executed.
    ///   - nextPartialResult: A closure that combines an accumulating value and
    ///     an element of `original` into a new accumulating value, to be used
    ///     in the next call of the `nextPartialResult` closure or returned to
    ///     the caller.
    /// - Returns: The final accumulated value. If `original` has no elements,
    ///   the result is `initialResult`.
    ///
    /// - Complexity: O(*n*), where *n* is the length of `original`.
    static func |>> <Result>(
        _ original: Self,
        _ resultGenerator: (
            initialResult: Result,
            nextPartialResult: (Result, Element) -> Result
        )
    ) -> Result {
        original.reduce(resultGenerator.initialResult, resultGenerator.nextPartialResult)
    }
}

// MARK: - For Each

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
    /// Using the `=>` operator is distinct from a `for`-`in` loop in two
    /// important ways:
    ///
    /// 1. You cannot use a `break` or `continue` statement to exit the current
    ///    call of the `body` closure or skip subsequent calls.
    /// 2. Using the `return` statement in the `body` closure will exit only from
    ///    the current call to `body`, not from any outer scope, and won't skip
    ///    subsequent calls.
    ///
    /// - Parameter sequence: The sequence to iterate over.
    /// - Parameter body: A closure that takes an element of `sequence` as a
    ///   parameter.
    static func => (
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
    /// Using the `=>` operator is distinct from a `for`-`in` loop in two
    /// important ways:
    ///
    /// 1. You cannot use a `break` or `continue` statement to exit the current
    ///    call of the `body` closure or skip subsequent calls.
    /// 2. Using the `return` statement in the `body` closure will exit only from
    ///    the current call to `body`, not from any outer scope, and won't skip
    ///    subsequent calls.
    ///
    /// - Parameter sequence: The sequence to iterate over.
    /// - Parameter body: A closure that takes an element of `sequence` and an
    ///   the current loop index as parameters.
    static func => (
        _ sequence: Self,
        _ body: (Int, Element) throws -> Void
    ) rethrows {
        try sequence.enumerated() => body
    }
}

// MARK: - Sorting

public extension Sequence where Element: Comparable {
    /// Returns the elements of `sequence`, sorted using the given predicate as
    /// the comparison between elements.
    ///
    /// When you want to sort a sequence of elements that don't conform to the
    /// `Comparable` protocol, pass a predicate to this operator that returns
    /// `true` when the first element should be ordered before the second. The
    /// elements of the resulting array are ordered according to the given
    /// predicate.
    ///
    /// In the following example, the predicate provides an ordering for an array
    /// of a custom `HTTPResponse` type. The predicate orders errors before
    /// successes and sorts the error responses by their error code.
    ///
    ///     enum HTTPResponse {
    ///         case ok
    ///         case error(Int)
    ///     }
    ///
    ///     let responses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
    ///     let sortedResponses = responses >< {
    ///         switch ($0, $1) {
    ///         // Order errors by code
    ///         case let (.error(aCode), .error(bCode)):
    ///             return aCode < bCode
    ///
    ///         // All successes are equivalent, so none is before any other
    ///         case (.ok, .ok): return false
    ///
    ///         // Order errors before successes
    ///         case (.error, .ok): return true
    ///         case (.ok, .error): return false
    ///         }
    ///     }
    ///     print(sortedResponses)
    ///     // Prints "[.error(403), .error(404), .error(500), .ok, .ok]"
    ///
    /// You also use this operator to sort elements that conform to the
    /// `Comparable` protocol in descending order. To sort your sequence in
    /// descending order, pass the greater-than operator (`>`) as the
    /// `areInIncreasingOrder` parameter.
    ///
    ///     let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
    ///     let descendingStudents = students >< (>)
    ///     print(descendingStudents)
    ///     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
    ///
    /// Calling the related `sorted()` method is equivalent to calling this
    /// operator and passing the less-than operator (`<`) as the predicate.
    ///
    ///     print(students.sorted())
    ///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
    ///     print(students >< (<))
    ///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
    ///
    /// The predicate must be a *strict weak ordering* over the elements. That
    /// is, for any elements `a`, `b`, and `c`, the following conditions must
    /// hold:
    ///
    /// - `areInIncreasingOrder(a, a)` is always `false`. (Irreflexivity)
    /// - If `areInIncreasingOrder(a, b)` and `areInIncreasingOrder(b, c)` are
    ///   both `true`, then `areInIncreasingOrder(a, c)` is also `true`.
    ///   (Transitive comparability)
    /// - Two elements are *incomparable* if neither is ordered before the other
    ///   according to the predicate. If `a` and `b` are incomparable, and `b`
    ///   and `c` are incomparable, then `a` and `c` are also incomparable.
    ///   (Transitive incomparability)
    ///
    /// The sorting algorithm is guaranteed to be stable. A stable sort
    /// preserves the relative order of elements for which
    /// `areInIncreasingOrder` does not establish an order.
    ///
    /// - Parameter sequence: The sequence to sort.
    /// - Parameter areInIncreasingOrder: A predicate that returns `true` if its
    ///   first argument should be ordered before its second argument;
    ///   otherwise, `false`.
    /// - Returns: A sorted array of `sequence`'s elements.
    ///
    /// - Complexity: O(*n* log *n*), where *n* is the length of `sequence`.
    static func >< (
        _ sequence: Self,
        _ areInIncreasingOrder: (Element, Element) throws -> Bool
    ) rethrows -> [Element] {
        try sequence.sorted(by: areInIncreasingOrder)
    }
}
