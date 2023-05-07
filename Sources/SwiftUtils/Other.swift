import Foundation

// MARK: - For Each

public func => (
    _ times: UInt,
    _ body: @escaping (UInt) throws -> ()
) rethrows {
    try (0..<times) => body
}

// MARK: - Ranges

extension Range: Defaultable where Bound: Defaultable {
    public static var defaultValue: Self { Bound.defaultValue..<Bound.defaultValue }
}
