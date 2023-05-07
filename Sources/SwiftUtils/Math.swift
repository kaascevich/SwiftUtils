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
    /// - Parameter x: A positive number.
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
    func root(index n: Int) -> Double {
        let n = Double(n)
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
    @inlinable static func √ (_ index: Int, _ radicand: Double) -> Double {
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
    
    /// A Boolean value indicating whether this value is not negative.
    ///
    /// This property returns `true` if this value is less than 0;
    /// otherwise, it returns `false`.
    @inlinable var isNotNegative: Bool {
        !isNegative
    }
    
    /// A Boolean value indicating whether this value is not positive.
    ///
    /// This property returns `true` if this value is greater than
    /// 0; otherwise, it returns `false`.
    @inlinable var isNotPositive: Bool {
        !isPositive
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

// MARK: - Parity

/// The parity of an integer.
///
/// An integer is even if its magnitude does not leave a remainder when
/// divided by 2.
public enum Parity {
    // A value evenly divisible by 2.
    case even
    
    // A value not evenly divisible by 2.
    case odd
}

public extension BinaryInteger where Self: SignedNumeric {
    /// The parity of this value.
    var parity: Parity {
        if self.isZero || |self % 2 == 0 {
            return .even
        } else {
            return .odd
        }
    }
    
    var isEven:    Bool { parity == .even }
    var isOdd:     Bool { parity == .odd  }
    
    var isNotEven: Bool { !isEven }
    var isNotOdd:  Bool { !isOdd  }
}

// MARK: - Zero Checking

public extension AdditiveArithmetic {
    /// A Boolean value indicating whether this value is equal to
    /// the zero value.
    var isZero: Bool {
        self == Self.zero
    }
}

// MARK: - isNot

public extension FloatingPoint {
    /// A Boolean value indicating whether the instance is not NaN ("not a number").
    ///
    /// Because NaN is not equal to any value, including NaN, use this property
    /// instead of the not-equal-to operator (`!=`) or equal-to operator (`==`)
    /// to test whether a value is not or is NaN. For example:
    ///
    ///     let x = 0.0
    ///     let y = x * .infinity
    ///     // y is a NaN
    ///
    ///     // Comparing with the not-equal-to operator never returns 'false'
    ///     print(x != Double.nan)
    ///     // Prints "true"
    ///     print(y != Double.nan)
    ///     // Prints "true"
    ///
    ///     // Test with the 'isNotNaN' property instead
    ///     print(x.isNotNaN)
    ///     // Prints "true"
    ///     print(y.isNotNaN)
    ///     // Prints "false"
    ///
    /// This property is `false` for both quiet and signaling NaNs.
    var isNotNaN: Bool { !isNaN }
    
    /// A Boolean value indicating whether the instance is not a signaling
    /// NaN.
    ///
    /// Signaling NaNs typically raise the Invalid flag when used in general
    /// computing operations.
    var isNotSignalingNaN: Bool { !isSignalingNaN }
    
    /// A Boolean value indicating whether the instance is not equal to zero.
    ///
    /// The `isNotZero` property of a value `x` is `false` when `x` represents
    /// either `-0.0` or `+0.0`. `x.isNotZero` is equivalent to the following
    /// comparison: `x != 0.0`.
    ///
    ///     let x = -0.0
    ///     x.isNotZero     // true
    ///     x != 0.0        // true
    var isNotZero: Bool { !isZero }
    
    /// A Boolean value indicating whether this instance is not finite.
    ///
    /// All values other than NaN and infinity are considered finite, whether
    /// normal or subnormal.  For NaN, both `isNotFinite` and `isNotInfinite`
    /// are true.
    var isNotFinite: Bool { !isFinite }
    
    /// A Boolean value indicating whether the instance is not infinite.
    ///
    /// For NaN, both `isNotFinite` and `isNotInfinite` are true.
    var isNotInfinite: Bool { !isInfinite }
    
    /// A Boolean value indicating whether this instance is not normal.
    ///
    /// A *normal* value is a finite number that uses the full precision
    /// available to values of a type. Zero is neither a normal nor a subnormal
    /// number.
    var isNotNormal: Bool { !isNormal }
    
    /// A Boolean value indicating whether the instance is not subnormal.
    ///
    /// A *subnormal* value is a nonzero number that has a lesser magnitude than
    /// the smallest normal number. Subnormal values don't use the full
    /// precision available to values of a type.
    ///
    /// Zero is neither a normal nor a subnormal number. Subnormal numbers are
    /// often called *denormal* or *denormalized* --- these are different names
    /// for the same concept.
    var isNotSubnormal: Bool { !isSubnormal }
    
    /// A Boolean value indicating whether the instance's representation is not
    /// in its canonical form.
    ///
    /// The [IEEE 754 specification][spec] defines a *canonical*, or preferred,
    /// encoding of a floating-point value. On platforms that fully support
    /// IEEE 754, every `Float` or `Double` value is canonical, but
    /// non-canonical values can exist on other platforms or for other types.
    /// Some examples:
    ///
    /// - On platforms that flush subnormal numbers to zero (such as armv7
    ///   with the default floating-point environment), Swift interprets
    ///   subnormal `Float` and `Double` values as non-canonical zeros.
    ///   (In Swift 5.1 and earlier, `isCanonical` is `true` for these
    ///   values, which is the incorrect value.)
    ///
    /// - On i386 and x86_64, `Float80` has a number of non-canonical
    ///   encodings. "Pseudo-NaNs", "pseudo-infinities", and "unnormals" are
    ///   interpreted as non-canonical NaN encodings. "Pseudo-denormals" are
    ///   interpreted as non-canonical encodings of subnormal values.
    ///
    /// - Decimal floating-point types admit a large number of non-canonical
    ///   encodings. Consult the IEEE 754 standard for additional details.
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    var isNotCanonical: Bool { !isCanonical }
}

public extension Collection {
    /// A Boolean value indicating whether the collection is not empty.
    var isNotEmpty: Bool { !isEmpty }
}
