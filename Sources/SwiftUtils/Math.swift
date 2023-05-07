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

    
// MARK: - Square Roots

prefix operator √

public extension Double {
    /// Returns the square root of `x`, rounded to a representable value.
    ///
    /// The following example declares a function that calculates the length of
    /// the hypotenuse of a right triangle given its two perpendicular sides.
    ///
    ///     func hypotenuse(_ a: Double, _ b: Double) -> Double {
    ///         return √(a * a + b * b)
    ///     }
    ///
    ///     let (dx, dy) = (3.0, 4.0)
    ///     let distance = hypotenuse(dx, dy)
    ///     // distance == 5.0
    ///
    ///
    /// - Returns: The square root of `x`.
    @inlinable static prefix func √ (_ x: Double) -> Double {
        2√x
    }
}

// MARK: - Arbitrary Roots

infix operator √: BitwiseShiftPrecedence

public extension Double {
    /// Returns the `n`th root of `self`, rounded to a representable value.
    ///
    /// The following example declares a function that calculates the length of
    /// the hypotenuse of a right triangle given its two perpendicular sides.
    ///
    ///     func hypotenuse(_ a: Double, _ b: Double) -> Double {
    ///         return (a * a + b * b).root(index: 2)
    ///     }
    ///
    ///     let (dx, dy) = (3.0, 4.0)
    ///     let distance = hypotenuse(dx, dy)
    ///     // distance == 5.0
    ///
    /// - Parameter index: The index to use when calculating the root.
    /// - Returns: The `n`th root of `self`.
    func root(index n: Double) -> Double {
        if isNegative, |(n.truncatingRemainder(dividingBy: 2)) == 1 {
            return -pow(-self, 1/n)
        } else {
            return pow(self, 1/n)
        }
    }
    
    /// Returns the root of the `radicand` with degree `index`, rounded to a
    /// representable value.
    ///
    /// The following example declares a function that calculates the length of
    /// the hypotenuse of a right triangle given its two perpendicular sides.
    ///
    ///     func hypotenuse(_ a: Double, _ b: Double) -> Double {
    ///         return 2√(a * a + b * b)
    ///     }
    ///
    ///     let (dx, dy) = (3.0, 4.0)
    ///     let distance = hypotenuse(dx, dy)
    ///     // distance == 5.0
    ///
    /// - Parameters:
    ///   - index: The index to use when calculating the root.
    ///   - radicand: The value to calculate the root of.
    ///
    /// - Returns: The root of the `radicand` with degree `index`.
    @inlinable static func √ (_ index: Double, _ radicand: Double) -> Double {
        radicand.root(index: index)
    }
}

// MARK: - Signs

public extension SignedNumeric where Self: Comparable {
    /// A Boolean value indicating whether this value is negative.
    ///
    /// This property returns `true` if this value is less than 0;
    /// otherwise, it returns `false`.
    @inlinable var isNegative: Bool {
        self < 0 as Self
    }
    
    /// A Boolean value indicating whether this value is positive.
    ///
    /// This property returns `true` if this value is greater than
    /// 0; otherwise, it returns `false`.
    @inlinable var isPositive: Bool {
        self > 0 as Self
    }
}

// MARK: - Percents

postfix operator %

public extension FloatingPoint {
    /// Returns the specified value divided by 100.
    ///
    /// The percentage operator (postfix `%`) returns its operand divided by
    /// 100.
    ///
    ///     let y = 21%
    ///     // y == 0.21
    ///
    /// - Parameter operand: The operand to divide.
    /// - Returns: The operand divided by 100.
    @inlinable static postfix func % (_ operand: Self) -> Self {
        operand/100
    }
}
