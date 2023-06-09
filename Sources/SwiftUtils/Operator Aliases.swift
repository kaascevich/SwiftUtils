import Foundation

// MARK: - Comparison

infix operator ≥: ComparisonPrecedence
infix operator ≤: ComparisonPrecedence

public extension Comparable {
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func ≥ (_ lhs: Self, _ rhs: Self) -> Bool {
        lhs >= rhs
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func ≤ (_ lhs: Self, _ rhs: Self) -> Bool {
        lhs <= rhs
    }
}

// MARK: - Division

infix operator ÷: MultiplicationPrecedence
infix operator ÷=: AssignmentPrecedence

public extension FloatingPoint {
    /// Returns the quotient of dividing the first value by the second, rounded
    /// to a representable value.
    ///
    /// The division operator (`÷`) calculates the quotient of the division if
    /// `rhs` is nonzero. If `rhs` is zero, the result of the division is
    /// infinity, with the sign of the result matching the sign of `lhs`.
    ///
    ///     let x = 16.875
    ///     let y = x ÷ 2.25
    ///     // y == 7.5
    ///
    ///     let z = x ÷ 0
    ///     // z.isInfinite == true
    ///
    /// The `÷` operator implements the division operation defined by the [IEEE
    /// 754 specification][spec].
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    @inlinable static func ÷ (_ lhs: Self, _ rhs: Self) -> Self {
        lhs / rhs
    }
    
    /// Divides the first value by the second and stores the quotient in the
    /// left-hand-side variable, rounding to a representable value.
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    @inlinable static func ÷= (_ lhs: inout Self, _ rhs: Self) {
        lhs /= rhs
    }
}

public extension BinaryInteger {
    /// Returns the quotient of dividing the first value by the second, rounded
    /// to a representable value.
    ///
    /// The division operator (`÷`) calculates the quotient of the division if
    /// `rhs` is nonzero. If `rhs` is zero, the result of the division is
    /// infinity, with the sign of the result matching the sign of `lhs`.
    ///
    ///     let x = 16.875
    ///     let y = x ÷ 2
    ///     // y == 8.4375
    ///
    ///     let z = x ÷ 0
    ///     // z.isInfinite == true
    ///
    /// The `÷` operator implements the division operation defined by the [IEEE
    /// 754 specification][spec].
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    @inlinable static func ÷ <T: FloatingPoint>(_ lhs: T, _ rhs: Self) -> T {
        lhs / rhs
    }
    
    /// Returns the quotient of dividing the first value by the second, rounded
    /// to a representable value.
    ///
    /// The division operator (`÷`) calculates the quotient of the division if
    /// `rhs` is nonzero. If `rhs` is zero, the result of the division is
    /// infinity, with the sign of the result matching the sign of `lhs`.
    ///
    ///     let x = 16
    ///     let y = x ÷ 2.5
    ///     // y == 6.4
    ///
    ///     let z = x ÷ 0
    ///     // z.isInfinite == true
    ///
    /// The `÷` operator implements the division operation defined by the [IEEE
    /// 754 specification][spec].
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    @inlinable static func ÷ <T: FloatingPoint>(_ lhs: Self, _ rhs: T) -> T {
        lhs / rhs
    }
    
    /// Returns the quotient of dividing the first value by the second, rounded
    /// to a representable value.
    ///
    /// The division operator (`÷`) calculates the quotient of the division if
    /// `rhs` is nonzero. If `rhs` is zero, the result of the division is
    /// infinity, with the sign of the result matching the sign of `lhs`.
    ///
    ///     let x = 16
    ///     let y = x ÷ 5
    ///     // y == 3.2
    ///
    ///     let z = x ÷ 0
    ///     // z.isInfinite == true
    ///
    /// The `÷` operator implements the division operation defined by the [IEEE
    /// 754 specification][spec].
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    @inlinable static func ÷ <T: FloatingPoint>(_ lhs: Self, _ rhs: Self) -> T {
        lhs / rhs
    }
    
    /// Divides the first value by the second and stores the quotient in the
    /// left-hand-side variable, rounding to a representable value.
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    @inlinable static func ÷= <T: FloatingPoint>(_ lhs: inout T, _ rhs: Self) {
        lhs /= rhs
    }
}
