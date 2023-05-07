import Foundation

public extension Dictionary {
    subscript<T>(_ key: Key, default defaultValue: @autoclosure () -> T) -> T {
        guard let value = self[key] as? T else {
            return defaultValue()
        }
        return value
    }
}
