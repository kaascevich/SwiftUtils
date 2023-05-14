import Foundation

// MARK: - Integers

public extension BinaryInteger {
    /// A Boolean value indicating whether this type is an unsigned integer type.
    ///
    /// *Signed* integer types can represent both positive and negative values.
    /// *Unsigned* integer types can represent only nonnegative values.
    @inlinable static var isUnigned: Bool { !isSigned }
}

// MARK: - Floats

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
    @inlinable var isNotNaN: Bool { !isNaN }
    
    /// A Boolean value indicating whether the instance is not a signaling
    /// NaN.
    ///
    /// Signaling NaNs typically raise the Invalid flag when used in general
    /// computing operations.
    @inlinable var isNotSignalingNaN: Bool { !isSignalingNaN }
    
    /// A Boolean value indicating whether the instance is not equal to zero.
    ///
    /// The `isNotZero` property of a value `x` is `false` when `x` represents
    /// either `-0.0` or `+0.0`. `x.isNotZero` is equivalent to the following
    /// comparison: `x != 0.0`.
    ///
    ///     let x = -0.0
    ///     x.isNotZero     // true
    ///     x != 0.0        // true
    @inlinable var isNotZero: Bool { !isZero }
    
    /// A Boolean value indicating whether this instance is not finite.
    ///
    /// All values other than NaN and infinity are considered finite, whether
    /// normal or subnormal.  For NaN, both `isNotFinite` and `isNotInfinite`
    /// are true.
    @inlinable var isNotFinite: Bool { !isFinite }
    
    /// A Boolean value indicating whether the instance is not infinite.
    ///
    /// For NaN, both `isNotFinite` and `isNotInfinite` are true.
    @inlinable var isNotInfinite: Bool { !isInfinite }
    
    /// A Boolean value indicating whether this instance is not normal.
    ///
    /// A *normal* value is a finite number that uses the full precision
    /// available to values of a type. Zero is neither a normal nor a subnormal
    /// number.
    @inlinable var isNotNormal: Bool { !isNormal }
    
    /// A Boolean value indicating whether the instance is not subnormal.
    ///
    /// A *subnormal* value is a nonzero number that has a lesser magnitude than
    /// the smallest normal number. Subnormal values don't use the full
    /// precision available to values of a type.
    ///
    /// Zero is neither a normal nor a subnormal number. Subnormal numbers are
    /// often called *denormal* or *denormalized* --- these are different names
    /// for the same concept.
    @inlinable var isNotSubnormal: Bool { !isSubnormal }
    
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
    @inlinable var isNotCanonical: Bool { !isCanonical }
}

// MARK: - Strings

public extension String {
    /// Returns whether this string is incapable of providing access to
    /// validly-encoded UTF-8 contents in contiguous memory in O(1) time.
    ///
    /// Contiguous strings always operate in O(1) time for withUTF8 and
    /// always give a result for String.UTF8View.withContiguousStorageIfAvailable.
    /// Contiguous strings also benefit from fast-paths and better optimizations.
    @inlinable var isNotContiguousUTF8: Bool { !isContiguousUTF8 }
}
