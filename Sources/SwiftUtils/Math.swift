import Foundation

// MARK: Absolute Value

public prefix func | <T: Comparable & SignedNumeric>(_ value: T) -> T {
    abs(value)
}

// MARK: - Squaring & Cubing

public extension Numeric {
    var squared: Self {
        self * self
    }
    mutating func formSquare() {
        self = squared
    }
}

public extension Numeric {
    var cubed: Self {
        self * self * self
    }
    mutating func formCube() {
        self = cubed
    }
}

// MARK: - Powers

public func ** (_ lhs: Double, _ rhs: Double) -> Double {
    pow(lhs, rhs)
}

// MARK: - Integer Roots

public prefix func √ (_ value: Double) -> Double {
    2√value
}

public prefix func ∛ (_ value: Double) -> Double {
    3√value
}

public prefix func ∜ (_ value: Double) -> Double {
    4√value
}

// MARK: - Arbitrary Roots

public func root(_ radicand: Double, index: Double) -> Double {
    if radicand.isNegative, |(index % 2) == 1 {
        return -pow(-radicand, 1/index)
    } else {
        return pow(radicand, 1/index)
    }
}

public func √ (_ index: Double, _ radicand: Double) -> Double {
    root(radicand, index: index)
}

// MARK: - Percents

public postfix func % <T: FloatingPoint>(_ value: T) -> T {
    value/100
}

// MARK: - Constants

public let π: Double = .pi

public let ½: Double = 1/2
public let ⅓: Double = 1/3
public let ⅔: Double = 2/3
public let ¼: Double = 1/4
public let ¾: Double = 3/4
public let ⅕: Double = 1/5
public let ⅖: Double = 2/5
public let ⅗: Double = 3/5
public let ⅘: Double = 4/5
public let ⅙: Double = 1/6
public let ⅚: Double = 5/6
public let ⅛: Double = 1/8
public let ⅜: Double = 3/8
public let ⅝: Double = 5/8
public let ⅞: Double = 7/8

// MARK: - Signs

public extension SignedNumeric where Self: Comparable {
    var isNegative: Bool {
        self < 0 as Self
    }
    
    var isPositive: Bool {
        !isNegative
    }
}

// MARK: - Modulo

public extension FloatingPoint {
    static func % (_ lhs: Self, _ rhs: Self) -> Self {
        lhs.truncatingRemainder(dividingBy: rhs)
    }
    static func %= (_ lhs: inout Self, _ rhs: Self) {
        lhs = lhs % rhs
    }
}
