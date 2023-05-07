import Foundation

// MARK: - For Each

public func => (
    _ times: UInt,
    _ body: @escaping (UInt) throws -> ()
) rethrows {
    try (0..<times) => body
}
