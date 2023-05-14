import Foundation

/// The parity of an integer.
///
/// An integer is even if its magnitude does not leave a remainder when
/// divided by 2; otherwise, it is odd.
public enum Parity {
    /// A value evenly divisible by 2.
    case even
    
    /// A value not evenly divisible by 2.
    case odd
}

public extension BinaryInteger where Self: SignedNumeric {
    /// The parity of this value.
    ///
    /// An integer is even if its magnitude does not leave a remainder when
    /// divided by 2; otherwise, it is odd.
    var parity: Parity {
        if self.isZero || |self % 2 == 0 {
            return .even
        } else {
            return .odd
        }
    }
    
    /// A Boolean value indicating whether this value is even.
    ///
    /// An integer is even if its magnitude does not leave a remainder when
    /// divided by 2.
    @inlinable var isEven: Bool { parity == .even }
    
    /// A Boolean value indicating whether this value is odd.
    ///
    /// An integer is odd if its magnitude leaves a remainder when divided by
    /// 2.
    @inlinable var isOdd: Bool { parity == .odd  }
    
    /// A Boolean value indicating whether this value is not even.
    ///
    /// An integer is even if its magnitude does not leave a remainder when
    /// divided by 2.
    @inlinable var isNotEven: Bool { !isEven }
    
    /// A Boolean value indicating whether this value is not odd.
    ///
    /// An integer is odd if its magnitude leaves a remainder when divided by
    /// 2.
    @inlinable var isNotOdd: Bool { !isOdd  }
}
