import Foundation

// MARK: - Collections

public extension Collection {
    @inlinable static prefix func ¡ <T>(_ items: Self) -> [T] where Element == T? {
        items --> { $0 }
    }
}

// MARK: - Nil Checking

public extension Optional {
    @inlinable static prefix func ¿ (_ value: Self) -> Bool {
        value == nil
    }
}

// MARK: - Optionalize

public prefix func ¿ <T, U>(_ closure: @escaping (T) -> U) -> (T?) -> U? {
    {
        guard let value = $0 else {
            return nil
        }
        return closure(value)
    }
}

// MARK: - Force Unwrapping

public postfix func ¡ <T>(_ value: T?) throws -> T {
    if ¿value {
        throw UnexpectedNilError()
    }
    return value!
}

struct UnexpectedNilError: Error { }
