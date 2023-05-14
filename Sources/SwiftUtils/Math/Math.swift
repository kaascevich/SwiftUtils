import Foundation

// MARK: - Absolute Value

prefix operator |

/// Returns the absolute value of the given number.
///
/// The absolute value of `x` must be representable in the same type. In
/// particular, the absolute value of a signed, fixed-width integer type's
/// minimum cannot be represented.
///
///     let x = Int8.min
///     // x == -128
///     let y = |x
///     // Overflow error
///
/// - Parameter x: A signed number.
/// - Returns: The absolute value of `x`.
@inlinable public prefix func | <T: Comparable & SignedNumeric>(_ x: T) -> T {
    abs(x)
}


// MARK: - Powers

public extension BinaryInteger {
    @inlinable func squared() -> Self {
        self * self
    }
    
    @inlinable func cubed() -> Self {
        self * self * self
    }
}

infix operator **: BitwiseShiftPrecedence

@inlinable public func ** (_ base: Double, _ power: Double) -> Double {
    pow(base, power)
}

// MARK: - Percents

postfix operator %

public extension FloatingPoint {
    /// Returns the given number divided by 100.
    ///
    /// The percentage operator (postfix `%`) returns its operand divided by
    /// 100.
    ///
    ///     let y = 21%
    ///     // y == 0.21
    ///
    /// - Parameter operand: The number to divide.
    /// - Returns: The given number divided by 100.
    @inlinable static postfix func % (_ operand: Self) -> Self {
        operand/100
    }
}

// MARK: - Zero Checking

public extension AdditiveArithmetic {
    /// A Boolean value indicating whether this value is equal to the zero value.
    @inlinable var isZero: Bool { self == Self.zero }
    
    /// A Boolean value indicating whether this value is not equal to the zero
    /// value.
    @inlinable var isNotZero: Bool { !isZero }
}
