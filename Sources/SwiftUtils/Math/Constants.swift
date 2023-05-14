import Foundation

// MARK: - Mathematical Constants

/// The mathematical constant pi (π), approximately equal to 3.14159.
///
/// When measuring an angle in radians, π is equivalent to a half-turn.
///
/// This value is rounded toward zero to keep user computations with angles
/// from inadvertently ending up in the wrong quadrant.
///
///     print(π)
///     // Prints "3.14159265358979"
public let π: Double = .pi

/// Positive infinity.
///
/// Infinity compares greater than all finite numbers and equal to other
/// infinite values.
///
///     let x = Double.greatestFiniteMagnitude
///     let y = x * 2
///     // y == infinity
///     // y > x
public let infinity: Double = .infinity

/// A quiet NaN ("not a number").
///
/// A NaN compares not equal, not greater than, and not less than every
/// value, including itself. Passing a NaN to an operation generally results
/// in NaN.
///
///     let x = 1.21
///     // x > NaN == false
///     // x < NaN == false
///     // x == NaN == false
///
/// Because a NaN always compares not equal to itself, to test whether a
/// floating-point value is NaN, use its `isNaN` property instead of the
/// equal-to operator (`==`). In the following example, `y` is NaN.
///
///     let y = x + NaN
///     print(y == NaN)
///     // Prints "false"
///     print(y.isNaN)
///     // Prints "true"
public let NaN: Double = .nan
