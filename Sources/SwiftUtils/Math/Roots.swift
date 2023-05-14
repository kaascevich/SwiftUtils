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
    ///         return √(a.squared() + b.squared())
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
    /// Returns the root of `self` with degree `index`, rounded to a
    /// representable value.
    ///
    /// The following example declares a function that calculates the length of
    /// the hypotenuse of a right triangle given its two perpendicular sides.
    ///
    ///     func hypotenuse(_ a: Double, _ b: Double) -> Double {
    ///         return (a.squared() + b.squared()).root(index: 2)
    ///     }
    ///
    ///     let (dx, dy) = (3.0, 4.0)
    ///     let distance = hypotenuse(dx, dy)
    ///     // distance == 5.0
    ///
    /// - Parameter index: The index to use when calculating the root.
    /// - Returns: The root of `self` with degree `index`.
    func root(withDegree index: Int) -> Double {
        if let self = self as? any SignedInteger,
           self.isNegative,
           |(index % 2) == 1
        {
            return -pow(-Double(self), 1/index)
        } else {
            return pow(Double(self), 1/index)
        }
    }
    
    /// Returns the root of `radicand` with degree `index`, rounded to a
    /// representable value.
    ///
    /// The following example declares a function that calculates the length of
    /// the hypotenuse of a right triangle given its two perpendicular sides.
    ///
    ///     func hypotenuse(_ a: Double, _ b: Double) -> Double {
    ///         return 2√(a.squared() + b.squared())
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
        radicand.root(withDegree: index)
    }
}
