import XCTest
@testable import SwiftUtils

final class SwiftUtilsTests: XCTestCase {
    // MARK: - Declarations
    
    let arrayWithNils = [1, 2, nil, 3, 2, nil, nil, 1]
    
    // MARK: - Tests
    
    func testDefaultable() throws {
        // MARK: Automatic Nil Coalescing
        let intWithValue:    Int? = 5
        let intWithoutValue: Int? = nil
        
        XCTAssertEqual(intWithValue.?,    5)
        XCTAssertEqual(intWithoutValue.?, 0)
    }
    
    func testMapping() throws {
        // MARK: Map
        XCTAssertEqual(arrayWithNils ==> \.isNil, [false, false, true, false, false, true, true, false])
        
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
        
        // MARK: Default Access Values
        let dict = [
            "keyOne": 42,
            "keyTwo": 69
        ]
        XCTAssertEqual(dict["keyOne",   default: 17], 42)
        XCTAssertEqual(dict["keyThree", default: 17], 17)
        
        // MARK: - Dictionaries as Arrays
        
        let expectedResult = [
            (key: "keyOne", value: 42),
            (key: "keyTwo", value: 69)
        ]
        
        // We can't use XCTAssertEqual or the == operator, since tuples
        // aren't Equatable. We can get around this using Array.elementsEqual().
        XCTAssert(dict.asArray().elementsEqual(expectedResult, by: ==))
    }
    
    func testForEach() throws {
        // MARK: Repeat x Times
        var string = ""
        3 => string.append("@autoclosure")
        XCTAssertEqual(string, "@autoclosure@autoclosure@autoclosure")
        
        // MARK: Repeat x Times with Index
        string.removeAll()
        5 => { num in string += §num }
        XCTAssertEqual(string, "01234")
        
        // MARK: Iterate through Range
        string.removeAll()
        6...9 => { num in string += §num }
        XCTAssertEqual(string, "6789")
        
        // MARK: For Each in Array
        string.removeAll()
        [1, 2, 3, 2, 1] => { num in string += §num }
        XCTAssertEqual(string, "12321")
        
        // MARK: For Each in Array with Index
        string.removeAll()
        ["macOS", "is", "the", "bestOS"] => { i, str in string += §str + §i }
        XCTAssertEqual(string, "macOS0is1the2bestOS3")
    }
    
    func testMath() throws {
        let positive243 = +243
        let negative243 = -243
        // MARK: Absolute Value
        XCTAssertEqual(|negative243, positive243)
        
        // MARK: Powers
        XCTAssertEqual(3 ** 4, 81)
        
        // MARK: Roots
        XCTAssertEqual(√2, sqrt(2))
        
        XCTAssertEqual(+3, positive243.root(index: 5))
        XCTAssertEqual(+3, 5√positive243)
        
        XCTAssertEqual(-3, negative243.root(index: 5))
        XCTAssertEqual(-3, 5√negative243)
        
        XCTAssert((√(-64)).isNaN)
        
        // MARK: Percents
        XCTAssertEqual(75%, 0.75)
        
        // MARK: Constants
        XCTAssertEqual(π, Double.pi)
        XCTAssertEqual(infinity, Double.infinity)
        XCTAssert     (NaN.isNaN)
        
        // MARK: Signs
        XCTAssertTrue  ((-5).isNegative)
        XCTAssertFalse ((-5).isPositive)
        
        XCTAssertFalse (0.isNegative)
        XCTAssertFalse (0.isPositive)
        
        // MARK: Squaring & Cubing
        XCTAssertEqual(4.squared(), 16)
        XCTAssertEqual(4.cubed(),   64)
        
        // MARK: Parity
        XCTAssertTrue  (0.isZero)
        XCTAssertFalse (5.isZero)
        
        XCTAssertTrue  (5.isOdd)
        XCTAssertTrue  (0.isEven)
        XCTAssertFalse ((-84).isOdd)
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
    
    func testOptionals() throws {
        // MARK: Force Unwrapping
        
        let intWithValue:    Int? = 5
        let intWithoutValue: Int? = nil
        
        XCTAssertNoThrow(try intWithValue¡)
        XCTAssertThrowsError(try intWithoutValue¡) { error in
            XCTAssertEqual(§type(of: error), "UnexpectedNilError")
        }
    }
}
