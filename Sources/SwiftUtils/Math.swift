import Foundation

// MARK: - Absolute Value

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

// MARK: - Scientific Notation

@inlinable public func ten(toThePowerOf exponent: Int) -> Double {
    10 ** exponent
}
// MARK: - Squaring

public extension Numeric {
    @inlinable var squared: Self {
        self * self
    }
    @inlinable mutating func formSquare() {
        self = squared
    }
}

// MARK: - Cubing

public extension Numeric {
    @inlinable var cubed: Self {
        self * self * self
    }
    @inlinable mutating func formCube() {
        self = cubed
    }
}

// MARK: - Powers

public extension Double {
    static func ** (_ base: Self, _ power: Self) -> Self {
        pow(base, power)
    }
    
    static func ** <T: BinaryInteger>(_ base: Self, _ power: T) -> Self {
        base ** Double(power)
    }
}
    
// MARK: - Integer Roots

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
    /// - Returns: The square root of `x`.
    @inlinable static prefix func √ (_ x: Self) -> Self {
        2√x
    }
    
    /// Returns the cube root of `x`, rounded to a representable value.
    ///
    /// - Returns: The cube root of `x`.
    @inlinable static prefix func ∛ (_ x: Self) -> Self {
        3√x
    }
    
    /// Returns the fourth root of `x`, rounded to a representable value.
    ///
    /// - Returns: The fourth root of `x`.
    @inlinable static prefix func ∜ (_ x: Self) -> Self {
        4√x
    }
}

// MARK: - Arbitrary Roots

public extension Double {
    /// Returns the `n`th root of `x`, rounded to a representable value.
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
    /// - Returns: The `n`th root of `x`.
    func root(index n: Self) -> Self {
        if isNegative, |(n % 2) == 1 {
            return -pow(-self, 1/n)
        } else {
            return pow(self, 1/n)
        }
    }
    
    /// Returns the `n`th root of `x`, rounded to a representable value.
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
    /// - Returns: The `n`th root of `x`.
    @inlinable static func √ (_ index: Self, _ radicand: Self) -> Self {
        radicand.root(index: index)
    }
}

// MARK: - Constants

/// The mathematical constant pi (π), approximately equal to 3.14159.
///
/// When measuring an angle in radians, π is equivalent to a half-turn.
///
/// This value is rounded toward zero to keep user computations with angles
/// from inadvertently ending up in the wrong quadrant.
///
///     print(π)
///     // Prints "3.141592653589793"
public let π: Double = .pi

// MARK: - Fractions

/// The mathematical constant one-eighth (⅛), equal to 0.125.
public let ⅛: Double = 1/8

/// The mathematical constant one-sixth (⅙), approximately equal to 0.16667.
public let ⅙: Double = 1/6

/// The mathematical constant one-fifth (⅕), equal to 0.2.
public let ⅕: Double = 1/5

/// The mathematical constant one-fourth (¼), equal to 0.25.
public let ¼: Double = 1/4

/// The mathematical constant one-third (⅓), approximately equal to 0.33333.
public let ⅓: Double = 1/3

/// The mathematical constant three-eighths (⅜), equal to 0.375.
public let ⅜: Double = 3/8

/// The mathematical constant two-fifths (⅖), equal to 0.4.
public let ⅖: Double = 2/5

/// The mathematical constant one-half (½), equal to 0.5.
public let ½: Double = 1/2

/// The mathematical constant three-fifths (⅗), equal to 0.6.
public let ⅗: Double = 3/5

/// The mathematical constant five-eighths (⅝), equal to 0.625.
public let ⅝: Double = 5/8

/// The mathematical constant two-thirds (⅔), approximately equal to 0.66667.
public let ⅔: Double = 2/3

/// The mathematical constant three-fourths (¾), equal to 0.75.
public let ¾: Double = 3/4

/// The mathematical constant four-fifths (⅘), equal to 0.8.
public let ⅘: Double = 4/5

/// The mathematical constant five-sixths (⅚), approximately equal to 0.83333.
public let ⅚: Double = 5/6

/// The mathematical constant seven-eighths (⅞), equal to 0.875.
public let ⅞: Double = 7/8

// MARK: - Signs

public extension SignedNumeric where Self: Comparable {
    /// Returns a Boolean value indicating whether this value is negative.
    ///
    /// - Returns: `true` if this value is less than 0; otherwise, `false`.
    @inlinable var isNegative: Bool {
        self < 0 as Self
    }
    
    /// Returns a Boolean value indicating whether this value is positive.
    ///
    /// - Returns: `true` if this value is greater than 0; otherwise, `false`.
    @inlinable var isPositive: Bool {
        self > 0 as Self
    }
}

// MARK: - Modulo

public extension FloatingPoint {
    /// Returns the remainder of the first value divided by the second value
    /// using truncating division.
    ///
    /// Performing truncating division with floating-point values results in a
    /// truncated integer quotient and a remainder. For values `x` and `y` and
    /// their truncated integer quotient `q`, the remainder `r` satisfies
    /// `x == y * q + r`.
    ///
    /// The following example calculates the truncating remainder of dividing
    /// 8.625 by 0.75:
    ///
    ///     let x = 8.625
    ///     print(x / 0.75)
    ///     // Prints "11.5"
    ///
    ///     let q = (x / 0.75).rounded(.towardZero)
    ///     // q == 11.0
    ///     let r = x % 0.75
    ///     // r == 0.375
    ///
    ///     let x1 = 0.75 * q + r
    ///     // x1 == 8.625
    ///
    /// If `lhs` and `rhs` are both finite numbers, the truncating
    /// remainder has the same sign as `lhs` and is strictly smaller in
    /// magnitude than `rhs`. The `%` operator is always exact.
    ///
    /// - Parameter lhs: The value to divide.
    /// - Parameter rhs: The value to use when dividing `lhs`.
    /// - Returns: The remainder of `lhs` divided by `rhs` using
    ///   truncating division.
    @inlinable static func % (_ lhs: Self, _ rhs: Self) -> Self {
        lhs.truncatingRemainder(dividingBy: rhs)
    }
    
    /// Replaces the first value with the remainder of itself divided by the
    /// second value using truncating division.
    ///
    /// Performing truncating division with floating-point values results in a
    /// truncated integer quotient and a remainder. For values `x` and `y` and
    /// their truncated integer quotient `q`, the remainder `r` satisfies
    /// `x == y * q + r`.
    ///
    /// The following example calculates the truncating remainder of dividing
    /// 8.625 by 0.75:
    ///
    ///     var x = 8.625
    ///     print(x / 0.75)
    ///     // Prints "11.5"
    ///
    ///     let q = (x / 0.75).rounded(.towardZero)
    ///     // q == 11.0
    ///     x %= 0.75
    ///     // r == 0.375
    ///
    ///     let x1 = 0.75 * q + x
    ///     // x1 == 8.625
    ///
    /// If `lhs` and `rhs` are both finite numbers, the truncating
    /// remainder has the same sign as `lhs` and is strictly smaller in
    /// magnitude than `rhs`. The `%=` operator is always exact.
    ///
    /// - Parameter lhs: The value to divide.
    /// - Parameter rhs: The value to use when dividing `lhs`.
    /// - Returns: The remainder of `lhs` divided by `rhs` using
    ///   truncating division.
    @inlinable static func %= (_ lhs: inout Self, _ rhs: Self) {
        lhs = lhs % rhs
    }
}

// MARK: - Percents
    
public extension FloatingPoint {
    /// Returns the specified value divided by 100.
    ///
    /// The percentage operator (postfix `%`) returns its argument divided by
    /// 100.
    ///
    ///     let x = 21.0
    ///     let y = x%
    ///     // y == 0.21
    ///
    /// - Returns: The argument divided by 100.
    @inlinable static postfix func % (_ operand: Self) -> Self {
        operand/100
    }
}
