import XCTest
@testable import SwiftUtils

final class RealWorldTests: XCTestCase {
    func testSum() throws {
        let sum = 1...8 ==> { $0.squared() } |>> (+)
        XCTAssertEqual(sum, 204)
    }
    
    func testTemperature() throws {
        let temperatureData = ["21.5", "19.25", "27", "no data", "28.25", "no data", "23"]
        let tempsCelsius = temperatureData ==> { Double($0) ?? NaN }
        XCTAssertEqual(§tempsCelsius, "[21.5, 19.25, 27.0, nan, 28.25, nan, 23.0]")
        
        let tempsFahrenheit = tempsCelsius ==> { $0 * (9/5) + 32 }
        XCTAssertEqual(§tempsFahrenheit, "[70.7, 66.65, 80.6, nan, 82.85, nan, 73.4]")
        
        let badAverage: Double = tempsFahrenheit ==> { $0 / tempsFahrenheit.count } |>> (+)
        XCTAssertTrue(badAverage.isNaN)
        
        let validTemps = tempsFahrenheit |> \.isNotNaN
        let average: Double = validTemps ==> { $0 / validTemps.count } |>> (+)
        let finalResult = "Average: \(average)°F in \(validTemps.count) out of \(tempsFahrenheit.count) observations."
        let expectedResult = "Average: 74.84°F in 5 out of 7 observations."
        XCTAssertEqual(finalResult, expectedResult)
    }
}
