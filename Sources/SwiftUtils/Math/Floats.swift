import Foundation

// MARK: - Normal/Subnormal Aliases

public extension FloatingPoint {
    /// A Boolean value indicating whether the instance is denormal.
    ///
    /// A *denormal* value is a nonzero number that has a lesser magnitude than
    /// the smallest normal number. Denormal values don't use the full
    /// precision available to values of a type.
    ///
    /// Zero is neither a normal nor a denormal number. Denormal numbers are
    /// often called *subnormal* or *denormalized* --- these are different names
    /// for the same concept.
    @inlinable var isDenormal: Bool { isSubnormal }
    
    /// A Boolean value indicating whether the instance is not denormal.
    ///
    /// A *denormal* value is a nonzero number that has a lesser magnitude than
    /// the smallest normal number. Denormal values don't use the full
    /// precision available to values of a type.
    ///
    /// Zero is neither a normal nor a denormal number. Denormal numbers are
    /// often called *subnormal* or *denormalized* --- these are different names
    /// for the same concept.
    @inlinable var isNotDenormal: Bool { isNotSubnormal }
    
    /// A Boolean value indicating whether the instance is denormalized.
    ///
    /// A *denormalized* value is a nonzero number that has a lesser magnitude
    /// than the smallest normal number. Denormal values don't use the full
    /// precision available to values of a type.
    ///
    /// Zero is neither a normalized nor a denormalized number. Denormalized
    /// numbers are often called *subnormal* or *denormal* --- these are
    /// different names for the same concept.
    @inlinable var isDenormalized: Bool { isDenormal }
    
    /// A Boolean value indicating whether the instance is not denormalized.
    ///
    /// A *denormalized* value is a nonzero number that has a lesser magnitude
    /// than the smallest normal number. Denormalized values don't use the full
    /// precision available to values of a type.
    ///
    /// Zero is neither a normalized nor a denormalized number. Denormalized
    /// numbers are often called *subnormal* or *denormal* --- these are
    /// different names for the same concept.
    @inlinable var isNotDenormalized: Bool { isNotDenormal }
    
    /// A Boolean value indicating whether this instance is normalized.
    ///
    /// A *normalized* value is a finite number that uses the full precision
    /// available to values of a type. Zero is neither a normalized nor a
    /// subnormalized number.
    @inlinable var isNormalized: Bool { isNormal }
    
    /// A Boolean value indicating whether this instance is not normalized.
    ///
    /// A *normalized* value is a finite number that uses the full precision
    /// available to values of a type. Zero is neither a normalized nor a
    /// subnormalized number.
    @inlinable var isNotNormalized: Bool { isNotNormal }
}
