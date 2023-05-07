import Foundation

// MARK: - Precedence Groups

precedencegroup PowerPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}

// MARK: - Collections

infix   operator =>  : AdditionPrecedence
infix   operator ==> : AdditionPrecedence

infix   operator |>  : AdditionPrecedence
infix   operator |>> : AdditionPrecedence

infix   operator ><  : AdditionPrecedence

// MARK: - Defaultable

postfix operator .?

// MARK: - Math

prefix  operator |

infix   operator **  : PowerPrecedence
infix   operator √   : PowerPrecedence
prefix  operator √
prefix  operator ∛
prefix  operator ∜

postfix operator %

// MARK: - Aliases

infix   operator ≥   : ComparisonPrecedence
infix   operator ≤   : ComparisonPrecedence

infix   operator ÷   : MultiplicationPrecedence
infix   operator ÷=  : AssignmentPrecedence

infix   operator ×   : MultiplicationPrecedence
infix   operator ×=  : AssignmentPrecedence


// MARK: - Optionals

prefix  operator ¡
prefix  operator ¿

postfix operator ¡

// MARK: - Strings

prefix operator §
