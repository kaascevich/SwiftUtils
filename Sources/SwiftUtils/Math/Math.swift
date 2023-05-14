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
    /// - Parameter x: The number to divide.
    /// - Returns: The given number divided by 100.
    @inlinable static postfix func % (_ x: Self) -> Self {
        x/100
    }
}

// MARK: - Zero Checking

public extension AdditiveArithmetic {
    /// A Boolean value indicating whether this value is equal to the zero value.
    @inlinable var isZero: Bool { self == .zero }
    
    /// A Boolean value indicating whether this value is not equal to the zero
    /// value.
    @inlinable var isNotZero: Bool { !isZero }
}

// MARK: - Reciprocals

public extension FloatingPoint {
    /// Returns the reciprocal of this value.
    ///
    /// The reciprocal is calculated by diving 1 by `self`.
    ///
    /// - Returns: 1 divided by `self`.
    @inlinable func reciprocal() -> Self {
        1/self
    }
    
    /// Replaces this value with its reciprocal.
    ///
    /// The reciprocal is calculated by diving 1 by `self`.
    @inlinable mutating func formReciprocal() {
        self = reciprocal()
    }
}
