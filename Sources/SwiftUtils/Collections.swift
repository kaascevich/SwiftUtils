import Foundation

// MARK: - Empty Values

public extension Collection {
    /// A Boolean value indicating whether the collection is not empty.
    var isNotEmpty: Bool {
        !isEmpty
    }
}

// MARK: - Mapping

infix operator =>: AdditionPrecedence
@discardableResult public func => <T: Collection, U>(
    _ original: T,
    _ transform: (T.Element) throws -> U
) rethrows -> [U] {
    try original.map(transform)
}

infix operator ==>: AdditionPrecedence
@discardableResult public func ==> <T: Collection, U>(
    _ original: T,
    _ transform: (T.Element) throws -> U?
) rethrows -> [U] {
    try original.compactMap(transform)
}

// MARK: - Filtering

infix operator |>: AdditionPrecedence
public func |> <T: Sequence>(
    _ items: T,
    _ isIncluded: (T.Element) -> Bool
) -> [T.Element] {
    items.filter(isIncluded)
}

// MARK: - Reducing

infix operator |>>: AdditionPrecedence

public func |>> <T: Collection>(
    _ original: T,
    _ transform: (
        initialResult: T.Element,
        nextPartialTransform: (T.Element, T.Element) -> T.Element
    )
) -> T.Element {
    original.reduce(transform.initialResult, transform.nextPartialTransform)
}

// MARK: - For Each

public func => <T: Sequence>(
    _ sequence: T,
    _ body: @escaping (T.Element) throws -> Any
) rethrows {
    for item in sequence {
        _ = try body(item)
    }
}

// MARK: - Sorting

infix operator ><: AdditionPrecedence
public func >< <T>(
    _ items: [T],
    _ areInIncreasingOrder: @escaping (T, T) throws -> Bool
) rethrows -> [T] {
    try items.sorted(by: areInIncreasingOrder)
}
