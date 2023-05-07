import Foundation

// MARK: - Reference Dates

public extension Date {
    // MARK: - Static Constants
    
    /// Returns a date instance that represents 00:00:00 UTC on 1 January
    /// 2001.
    ///
    /// This property is equivalent to calling
    /// `init(timeIntervalSinceReferenceDate: 0)`.
    static let referenceDate = Date(timeIntervalSinceReferenceDate: 0)
    
    /// Returns a date instance that represents 00:00:00 UTC on 1 January
    /// 1970.
    ///
    /// This property is equivalent to calling `init(timeIntervalSince1970: 0)`.
    static let epoch = Date(timeIntervalSince1970: 0)
    
    // MARK: - Static Properties
    
    /// The number of seconds from 1 January 1970 to the reference date,
    /// 1 January 2001.
    static var timeIntervalBetweenEpochAndReferenceDate: Double {
        timeIntervalBetween1970AndReferenceDate
    }
    
    /// The interval between 00:00:00 UTC on 1 January 1970 and the
    /// current date and time.
    static var timeIntervalSinceEpoch: Double {
        now.timeIntervalSinceEpoch
    }
    
    // MARK: - Properties
    
    /// The interval between the date value and 00:00:00 UTC on 1 January
    /// 1970.
    ///
    /// This property’s value is negative if the date object is earlier than
    /// 00:00:00 UTC on 1 January 1970.
    var timeIntervalSinceEpoch: Double {
        timeIntervalSince1970
    }
    
    // MARK: - Intiializers
    
    /// Creates a date value initialized relative to 00:00:00 UTC on 1
    /// January 1970 by a given number of seconds.
    init(timeIntervalSinceEpoch: TimeInterval) {
        self.init(timeIntervalSince1970: timeIntervalSinceEpoch)
    }
}
