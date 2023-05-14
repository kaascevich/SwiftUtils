import Foundation

precedencegroup ForEachPrecedence {
    associativity: left
    lowerThan: RangeFormationPrecedence
    higherThan: TernaryPrecedence
}
