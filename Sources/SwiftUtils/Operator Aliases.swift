import Foundation

// MARK: - Comparison

public extension Comparable {
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ≥ (_ lhs: Self, _ rhs: Self) -> Bool {
        lhs >= rhs
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ≤ (_ lhs: Self, _ rhs: Self) -> Bool {
        lhs <= rhs
    }
}

// MARK: - Division

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
    static func ÷ (_ lhs: Self, _ rhs: Self) -> Self {
        lhs / rhs
    }
    
    /// Divides the first value by the second and stores the quotient in the
    /// left-hand-side variable, rounding to a representable value.
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    static func ÷= (_ lhs: inout Self, _ rhs: Self) {
        lhs /= rhs
    }
}

// MARK: - Multiplication

public extension Numeric {
    /// Multiplies two values and produces their product.
    ///
    /// The multiplication operator (`×`) calculates the product of its two
    /// arguments. For example:
    ///
    ///     2 × 3                   // 6
    ///     100 × 21                // 2100
    ///     -10 × 15                // -150
    ///     3.5 × 2.25              // 7.875
    ///
    /// You cannot use `×` with arguments of different types. To multiply values
    /// of different types, convert one of the values to the other value's type.
    ///
    ///     let x: Int8 = 21
    ///     let y: Int = 1000000
    ///     Int(x) × y              // 21000000
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func × (_ lhs: Self, _ rhs: Self) -> Self {
        lhs * rhs
    }
    
    /// Multiplies two values and stores the result in the left-hand-side
    /// variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    static func ×= (_ lhs: inout Self, _ rhs: Self) {
        lhs *= rhs
    }
}
