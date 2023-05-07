import Foundation

// MARK: - Reference Dates

public extension Date {
    static var referenceDate: Date {
        Date(timeIntervalSinceReferenceDate: 0)
    }
    static var epoch: Date {
        Date(timeIntervalSince1970: 0)
    }
    static var timeIntervalBetweenEpochAndReferenceDate: Double {
        timeIntervalBetween1970AndReferenceDate
    }
    static var timeIntervalSinceEpoch: Double {
        now.timeIntervalSinceEpoch
    }
    
    var timeIntervalSinceEpoch: Double {
        timeIntervalSince1970
    }
    
    init(timeIntervalSinceEpoch: TimeInterval) {
        self.init(timeIntervalSince1970: timeIntervalSinceEpoch)
    }
}
