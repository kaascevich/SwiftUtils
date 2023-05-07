import Foundation

public func + (_ lhs: String, _ rhs: Any) -> String {
    return lhs.appending(String(describing: rhs))
}

public func += (_ lhs: inout String, _ rhs: Any) {
    lhs = lhs + rhs
}
