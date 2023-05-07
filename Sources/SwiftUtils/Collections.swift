import Foundation

// MARK: - Empty Values

public extension Collection {
    /// A Boolean value indicating whether the collection is not empty.
    var isNotEmpty: Bool {
        !isEmpty
    }
}

// MARK: - Mapping

@discardableResult public func => <T: Sequence, U>(
    _ original: T,
    _ transform: (T.Element) throws -> U
) rethrows -> [U] {
    try original.map(transform)
}

@discardableResult public func ==> <T: Sequence, U>(
    _ original: T,
    _ transform: (T.Element) throws -> U?
) rethrows -> [U] {
    try original.compactMap(transform)
}

// MARK: - Filtering

public func |> <T: Sequence>(
    _ items: T,
    _ isIncluded: (T.Element) -> Bool
) -> [T.Element] {
    items.filter(isIncluded)
}

// MARK: - Reducing

public extension Sequence {
    static func |>> (
        _ original: Self,
        _ transform: (
            initialResult: Element,
            nextPartialTransform: (Element, Element) -> Element
        )
    ) -> Element {
        original.reduce(transform.initialResult, transform.nextPartialTransform)
    }
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

public func >< <T: RandomAccessCollection>(
    _ items: T,
    _ areInIncreasingOrder: @escaping (T.Element, T.Element) throws -> Bool
) rethrows -> [T.Element] {
    try items.sorted(by: areInIncreasingOrder)
}
