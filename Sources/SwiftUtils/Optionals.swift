import Foundation

// MARK: - Collections

public prefix func ! <T, U: Collection>(_ items: U) -> [T] where U.Element == T? {
    items ==> { $0 }
}

// MARK: - Nil Checking

prefix operator ???
public prefix func ??? <T>(_ value: T?) -> Bool {
    value == nil
}

// MARK: - Optionalize

prefix operator ¿
public prefix func ¿ <T, U>(_ closure: @escaping (T) -> (U)) -> (T?) -> (U?) {
    {
        guard let value = $0 else {
            return nil
        }
        return closure(value)
    }
}

// MARK: - Force Unwrapping

postfix operator ¡
public postfix func ¡ <T>(_ value: T?) throws -> T {
    if ???value {
        throw UnexpectedNilError()
    }
    return value!
}

struct UnexpectedNilError: Error { }
