import XCTest
@testable import SwiftUtils

final class SwiftUtilsTests: XCTestCase {
    // MARK: - Declarations
    
    let arrayWithNils = [1, 2, nil, 3, 2, nil, nil, 1]
    
    // MARK: - Tests
    
    func testDefaultable() throws {
        // MARK: Coalesce with Default
        XCTAssertEqual(5.?, 5)
        XCTAssertEqual((nil as Int?).?, 0)
    }
    
    func testMapping() throws {
        // MARK: Mapping and Nil Checking
        XCTAssertEqual(arrayWithNils ==> (??), [false, false, true, false, false, true, true, false])
        
        // MARK: Compact Map
        XCTAssertEqual(arrayWithNils --> ¿{ $0 + 1 }, [2, 3, 4, 3, 2])
    }
    
    func testFiltering() throws {
        // MARK: Nil Removal
        XCTAssertEqual(¡arrayWithNils, [1, 2, 3, 2, 1])
        
        // MARK: Reduce
        XCTAssertEqual(¡arrayWithNils |>> (+), 9)
        
        // MARK: Filter
        XCTAssertEqual(arrayWithNils |> { $0.? > 1 }, [2, 3, 2])
    }
    
    func testCollections() throws {
        // MARK: Not Empty
        XCTAssert(arrayWithNils.isNotEmpty)
        
        // MARK: Sort
        XCTAssertEqual(¡arrayWithNils >< (<), [1, 1, 2, 2, 3])
    }
    
    func testForEach() throws {
        // MARK: Repeat X Times
        var string = ""
        5 => { num in string += §num }
        XCTAssertEqual(string, "01234")
        
        // MARK: Iterate through Range
        string = ""
        6...9 => { num in string += §num }
        XCTAssertEqual(string, "6789")
        
        // MARK: For Each in Array
        string = ""
        [1, 2, 3, 2, 1] => { num in string += §num }
        XCTAssertEqual(string, "12321")
        
        // MARK: For Each in Array with Index
        string = ""
        ["macOS", "is", "the", "bestOS"] => { i, str in string += §str + §i }
        XCTAssertEqual(string, "macOS0is1the2bestOS3")
    }
    
    func testMath() throws {
        // MARK: Absolute Value
        let negative42 = -42
        XCTAssertEqual(|negative42, +42)
        
        // MARK: Powers
        XCTAssertEqual(3 ** 4, 81)
        
        // MARK: Roots
        XCTAssertEqual(√2, sqrt(2))
        
        XCTAssertEqual(+3, +243.root(index: 5))
        XCTAssertEqual(+3, 5√(+243))
        
        XCTAssertEqual(-3, -243.root(index: 5))
        XCTAssertEqual(-3, 5√(-243))
        
        // MARK: Percents
        XCTAssertEqual(75%, 0.75)
        
        // MARK: Constants
        XCTAssertEqual(π, Double.pi)
        
        // MARK: Signs
        XCTAssertTrue  ((-5).isNegative)
        XCTAssertFalse ((-5).isPositive)
        
        XCTAssertFalse (0.isNegative)
        XCTAssertFalse (0.isPositive)
        
        // MARK: Squaring & Cubing
        XCTAssertEqual(4.squared(), 16)
        XCTAssertEqual(4.cubed(),   64)
        
        // MARK: Extra
        let sum = 1...8 ==> { $0.squared() } |>> (+)
        XCTAssertEqual(sum, 204)
    }
    
    func testOperatorAliases() throws {
        // MARK: Division
        XCTAssertEqual(0.75, 3 ÷ 4)
        
        var x = 3.0
        x ÷= 4
        XCTAssertEqual(0.75, x)
        
        // MARK: Comparison
        XCTAssertTrue  (3 ≤ 4)
        XCTAssertFalse (3 ≥ 4)
    }
}
