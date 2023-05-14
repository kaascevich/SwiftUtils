import Foundation

// MARK: - Square Roots

prefix operator √

public extension BinaryInteger {
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
    @inlinable static prefix func √ (_ x: Self) -> Double {
        2√x
    }
}

// MARK: - Arbitrary Roots

infix operator √: BitwiseShiftPrecedence

public extension BinaryInteger {
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
        if ((self as? any SignedInteger)?.isNegative).?,
           |(n.truncatingRemainder(dividingBy: 2)) == 1
        {
            return -pow(-Double(self), 1/n)
        } else {
            return pow(Double(self), 1/n)
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
    @inlinable static func √ (_ index: Int, _ radicand: Self) -> Double {
        radicand.root(index: index)
    }
}
