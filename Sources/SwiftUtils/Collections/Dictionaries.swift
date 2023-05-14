import Foundation

public extension Dictionary {
    /// Accesses the value associated with the given key for reading and writing,
    /// returning `defaultValue` if the key is not found.
    ///
    /// This *key-based* subscript returns the value for the given key if the key
    /// is found in the dictionary, or `defaultValue` if the key is not found.
    ///
    /// The following example creates a new dictionary and prints the value of a
    /// key found in the dictionary (`"Coral"`) and a key not found in the
    /// dictionary (`"Cerise"`), using a default value of `94`.
    ///
    ///     var hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
    ///     print(hues["Coral", defaultValue: 94])
    ///     // Prints "Optional(16)"
    ///     print(hues["Cerise", defaultValue: 94])
    ///     // Prints "94"
    ///
    /// - Parameters:
    ///   - key: The key to find in the dictionary.
    ///   - defaultValue: The value to return if `key` is not in the dictionary.
    /// - Returns: The value associated with `key` if `key` is in the dictionary;
    ///   otherwise, `defaultValue`.
    subscript(_ key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
        guard let value = self[key] else {
            return defaultValue()
        }
        return value
    }
    
    func asArray() -> [(key: Key, value: Value)] {
        self ==> { (key: $0, value: $1) }
    }
}
