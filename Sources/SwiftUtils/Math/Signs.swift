import Foundation

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
