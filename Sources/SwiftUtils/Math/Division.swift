import Foundation

public extension FloatingPoint {
    /// Returns the quotient of dividing the first value by the second, rounded
    /// to a representable value.
    ///
    /// The division operator (`/`) calculates the quotient of the division if
    /// `rhs` is nonzero. If `rhs` is zero, the result of the division is
    /// infinity, with the sign of the result matching the sign of `lhs`.
    ///
    ///     let x = 16.875
    ///     let y = x / 2
    ///     // y == 8.4375
    ///
    ///     let z = x / 0
    ///     // z.isInfinite == true
    ///
    /// The `/` operator implements the division operation defined by the [IEEE
    /// 754 specification][spec].
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    @inlinable static func / <T: BinaryInteger>(_ lhs: Self, _ rhs: T) -> Self {
        lhs / Self(rhs)
    }
    
    /// Returns the quotient of dividing the first value by the second, rounded
    /// to a representable value.
    ///
    /// The division operator (`/`) calculates the quotient of the division if
    /// `rhs` is nonzero. If `rhs` is zero, the result of the division is
    /// infinity, with the sign of the result matching the sign of `lhs`.
    ///
    ///     let x = 16
    ///     let y = x / 2.5
    ///     // y == 6.4
    ///
    ///     let z = x / 0
    ///     // z.isInfinite == true
    ///
    /// The `/` operator implements the division operation defined by the [IEEE
    /// 754 specification][spec].
    ///
    /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    @inlinable static func / <T: BinaryInteger>(_ lhs: T, _ rhs: Self) -> Self {
        Self(lhs) / rhs
    }
    
    /// Divides the first value by the second and stores the quotient in the
    /// left-hand-side variable, rounding to a representable value.
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by.
    @inlinable static func /= <T: BinaryInteger>(_ lhs: inout Self, _ rhs: T) {
        lhs = lhs / rhs
    }
}
