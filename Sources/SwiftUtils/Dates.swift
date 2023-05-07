import Foundation

public extension Date {
    /// Returns a date instance that represents 00:00:00 UTC on 1 January
    /// 2001.
    ///
    /// This property is equivalent to calling
    /// `init(timeIntervalSinceReferenceDate: 0)`.
    static let referenceDate = Date(timeIntervalSinceReferenceDate: 0)
}
