import Foundation

// MARK: - Collections

prefix operator ¡

public extension Sequence {
    @inlinable static prefix func ¡ <T>(_ items: Self) -> [T] where Element == T? {
        items --> { $0 }
    }
}

// MARK: - Nil Checking

prefix operator ??
prefix operator ?!

public extension Optional {
    @inlinable static prefix func ?? (_ value: Self) -> Bool {
        value == nil
    }
    
    @inlinable static prefix func ?! (_ value: Self) -> Bool {
        value != nil
    }
}

// MARK: - Optionalization

prefix operator ¿

public prefix func ¿ <T, U>(_ closure: @escaping (T) -> U) -> (T?) -> U? {
    {
        guard let value = $0 else {
            return nil
        }
        return closure(value)
    }
}

// MARK: - Force Unwrapping

postfix operator ¡

public extension Optional {
    /// An error indicating that a nil value was unexpectedly found
    /// while unwrapping an optional.
    struct UnexpectedNilError: Error { }
    
    static postfix func ¡ (_ value: Self) throws -> Wrapped {
        if ??value {
            throw UnexpectedNilError()
        }
        return value!
    }
}
