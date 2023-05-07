import Foundation

// MARK: - Comparison

infix operator ≥: ComparisonPrecedence
infix operator ≤: ComparisonPrecedence

public func ≥ <T: Comparable>(_ lhs: T, _ rhs: T) -> Bool {
    lhs >= rhs
}
public func ≤ <T: Comparable>(_ lhs: T, _ rhs: T) -> Bool {
    lhs <= rhs
}

// MARK: - Division

infix operator ÷: MultiplicationPrecedence
public func ÷ <T: FloatingPoint>(_ lhs: T, _ rhs: T) -> T {
    lhs / rhs
}

infix operator ÷=: AssignmentPrecedence
public func ÷= <T: FloatingPoint>(_ lhs: inout T, _ rhs: T) {
    lhs /= rhs
}

// MARK: - Multiplication

infix operator ×: MultiplicationPrecedence
public func × <T: Numeric>(_ lhs: T, _ rhs: T) -> T {
    lhs * rhs
}

infix operator ×=: AssignmentPrecedence
public func ×= <T: Numeric>(_ lhs: inout T, _ rhs: T) {
    lhs *= rhs
}
