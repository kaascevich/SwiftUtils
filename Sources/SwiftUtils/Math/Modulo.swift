import Foundation

public extension FloatingPoint {
    /// Returns the remainder of `self` divided by `other` using truncating
    /// division.
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
    /// If `self` and `other` are both finite numbers, the truncating remainder
    /// has the same sign as `self` and is strictly smaller in magnitude than
    /// `other`. The `%` operator is always exact.
    ///
    /// - Parameters:
    ///   - self: The value to divide by `other`.
    ///   - other: The value to use when dividing `self`.
    /// - Returns: The remainder of `self` divided by `other` using truncating
    ///   division.
    static func % (_ self: Self, _ other: Self) -> Self {
        self.truncatingRemainder(dividingBy: other)
    }
    
    /// Replaces `self` with the remainder of itself divided by `other`
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
    ///     var x = 8.625
    ///     print(x / 0.75)
    ///     // Prints "11.5"
    ///
    ///     let q = (x / 0.75).rounded(.towardZero)
    ///     // q == 11.0
    ///     x %= 0.75
    ///     // x == 0.375
    ///
    ///     let x1 = 0.75 * q + x
    ///     // x1 == 8.625
    ///
    /// If `self` and `other` are both finite numbers, the truncating remainder
    /// has the same sign as `self` and is strictly smaller in magnitude than
    /// `other`. The `%=` operator is always exact.
    ///
    /// - Parameters:
    ///   - self: The value to divide by `other`.
    ///   - other: The value to use when dividing `self`.
    static func %= (_ self: inout Self, _ other: Self) {
        self.formTruncatingRemainder(dividingBy: other)
    }
}
