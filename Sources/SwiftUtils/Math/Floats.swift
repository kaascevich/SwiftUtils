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

// MARK: - Quiet NaNs

public extension FloatingPoint {
    /// A Boolean value indicating whether the instance is a quiet NaN.
    @inlinable var isQuietNaN: Bool { isNaN && isNotSignalingNaN }
    
    /// A Boolean value indicating whether the instance is not a quiet NaN.
    @inlinable var isNotQuietNaN: Bool { !isQuietNaN }
}

// MARK: - e (Euler's Number)

public extension BinaryFloatingPoint {
    /// The mathematical constant e (Euler's number), approximately equal to 2.71828.
    static var e: Self {
        // 46 digits, just in case we get an ultra-high precision float
        2.71828_18284_59045_23536_02874_71352_66249_77572_47093
    }
}
