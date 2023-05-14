import Foundation

public extension BinaryInteger {
    /// Returns the square of this value.
    ///
    /// The square is calculated by multiplying this value by itself.
    ///
    /// - Returns: The square of this value.
    @inlinable func squared() -> Self {
        self * self
    }
    
    /// Returns the cube of this value.
    ///
    /// The cube is calculated by multiplying this value by itself twice.
    ///
    /// - Returns: The cube of this value.
    @inlinable func cubed() -> Self {
        self * self * self
    }
    
    /// Replaces this value with its square.
    ///
    /// The square is calculated by multiplying this value by itself.
    @inlinable mutating func formSquare() {
        self = squared()
    }
    
    /// Replaces this value with its cube.
    ///
    /// The cube is calculated by multiplying this value by itself twice.
    @inlinable mutating func formCube() {
        self = cubed()
    }
}

infix operator **: BitwiseShiftPrecedence

/// Raises `base` to an arbitrary power.
@inlinable public func ** (_ base: Double, _ power: Double) -> Double {
    pow(base, power)
}
