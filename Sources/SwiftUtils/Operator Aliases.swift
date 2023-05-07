import Foundation

// MARK: - Comparison

public func ≥ <T: Comparable>(_ lhs: T, _ rhs: T) -> Bool {
    lhs >= rhs
}
public func ≤ <T: Comparable>(_ lhs: T, _ rhs: T) -> Bool {
    lhs <= rhs
}

// MARK: - Division

public func ÷ <T: FloatingPoint>(_ lhs: T, _ rhs: T) -> T {
    lhs / rhs
}

public func ÷= <T: FloatingPoint>(_ lhs: inout T, _ rhs: T) {
    lhs /= rhs
}

// MARK: - Multiplication

public func × <T: Numeric>(_ lhs: T, _ rhs: T) -> T {
    lhs * rhs
}

public func ×= <T: Numeric>(_ lhs: inout T, _ rhs: T) {
    lhs *= rhs
}
