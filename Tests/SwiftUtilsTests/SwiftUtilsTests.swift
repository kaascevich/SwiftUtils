import XCTest
@testable import SwiftUtils

final class SwiftUtilsTests: XCTestCase {
    func testDefaultable() throws {
        // MARK: Coalesce with Default
        XCTAssertEqual(5.?, 5)
        XCTAssertEqual((nil as Int?).?, 0)
    }
    
    func testCollections() throws {
        // MARK: Nil Removal
        let arrayWithNils = [1, 2, nil, 3, 2, nil, nil, 1]
        XCTAssertEqual(¡arrayWithNils, [1, 2, 3, 2, 1])
        
        // MARK: Map
        XCTAssertEqual(arrayWithNils => (¿), [false, false, true, false, false, true, true, false])
        
        // MARK: Compact Map & Optionalization
        XCTAssertEqual(arrayWithNils ==> ¿{ $0 + 1 }, [2, 3, 4, 3, 2])
        
        // MARK: Reduce
        XCTAssertEqual(¡arrayWithNils |>> (3, +), 12)
        
        // MARK: Filter
        XCTAssertEqual(arrayWithNils |> { $0.? > 1 }, [2, 3, 2])
        
        // MARK: Not Empty
        XCTAssert(arrayWithNils.isNotEmpty)
        
        // MARK: Sort
        XCTAssertEqual(¡arrayWithNils >< (<), [1, 1, 2, 2, 3])
    }
    
    func testForEach() throws {
        // MARK: Repeat X Times
        var string = ""
        5 => { i in string += §i }
        XCTAssertEqual(string, "01234")
        
        // MARK: Iterate through Range
        string = ""
        (6...9) => { i in string += §i }
        XCTAssertEqual(string, "6789")
        
        // MARK: For Each in Array
        string = ""
        [1, 2, 3, 2, 1] => { i in string += §i }
        XCTAssertEqual(string, "12321")
    }
    
    func testMath() throws {
        // MARK: Absolute Value
        let negative42 = -42
        XCTAssertEqual(|negative42, 42)
        
        // MARK: Exponentiation
        XCTAssertEqual(3 ** 4, 81)
        
        // MARK: Roots
        XCTAssertEqual(√2, sqrt(2))
        XCTAssertEqual(∛8, 2)
        XCTAssertEqual(∜81, 3)
        
        let fifthRootOf243: Double = 3
        XCTAssertEqual(fifthRootOf243, root(243, index: 5))
        XCTAssertEqual(fifthRootOf243, 5√243)
        
        let fifthRootOfNegative243: Double = -3
        XCTAssertEqual(fifthRootOfNegative243, root(-243, index: 5))
        XCTAssertEqual(fifthRootOfNegative243, 5√(-243))
        
        // MARK: Percents
        XCTAssertEqual(75%, 0.75)
        
        // MARK: Constants
        XCTAssertEqual(π, Double.pi)
        XCTAssertEqual(½, 1/2)
        XCTAssertEqual(⅓, 1/3)
        XCTAssertEqual(⅔, 2/3)
        XCTAssertEqual(¼, 1/4)
        XCTAssertEqual(¾, 3/4)
        XCTAssertEqual(⅕, 1/5)
        XCTAssertEqual(⅖, 2/5)
        XCTAssertEqual(⅗, 3/5)
        XCTAssertEqual(⅘, 4/5)
        XCTAssertEqual(⅙, 1/6)
        XCTAssertEqual(⅚, 5/6)
        XCTAssertEqual(⅛, 1/8)
        XCTAssertEqual(⅜, 3/8)
        XCTAssertEqual(⅝, 5/8)
        XCTAssertEqual(⅞, 7/8)
        
        // MARK: Signs
        XCTAssertTrue  ((-5).isNegative)
        XCTAssertFalse ((-5).isPositive)
        
        // MARK: Squaring & Cubing
        XCTAssertEqual(4.squared, 16)
        XCTAssertEqual(4.cubed, 64)
        
        // MARK: Extra
        let sum = (1...8) => \.squared |>> (0, +)
        XCTAssertEqual(sum, 204)
    }
    
    func testOperatorAliases() throws {
        // MARK: Division
        XCTAssertEqual(0.75, 3 ÷ 4)
        
        var x = 3.0
        x ÷= 4
        XCTAssertEqual(0.75, x)
        
        // MARK: Multiplication
        XCTAssertEqual(12, 3 × 4)
        
        x = 3.0
        x ×= 4
        XCTAssertEqual(12, x)
        
        // MARK: Comparison
        
        XCTAssertTrue  (3 ≤ 4)
        XCTAssertFalse (3 ≥ 4)
    }
}

final class DocumentationTests: XCTestCase {
    func testDocumentationCodeExamples() throws {
        // MARK: Map
        let cast = ["Vivien", "Marlon", "Kim", "Karl"]
        let lowercaseNames = cast => { $0.lowercased() }
        XCTAssertEqual(lowercaseNames, ["vivien", "marlon", "kim", "karl"])
        let letterCounts = cast => \.count
        XCTAssertEqual(letterCounts, [6, 6, 3, 4])
        
        // MARK: Filter
        let shortNames = cast |> { $0.count < 5 }
        XCTAssertEqual(shortNames, ["Kim", "Karl"])
        
        // MARK: Reduce
        let numbers = [1, 2, 3, 4]
        let numberSum = numbers |>> (0, { x, y in
            x + y
        })
        XCTAssertEqual(numberSum, 10)
        
        // MARK: Compact Map
        let possibleNumbers = ["1", "2", "three", "///4///", "5"]
        
        let mapped: [Int?] = possibleNumbers => { str in Int(str) }
        XCTAssertEqual(mapped, [1, 2, nil, nil, 5])
        
        let compactMapped: [Int] = possibleNumbers ==> { str in Int(str) }
        XCTAssertEqual(compactMapped, [1, 2, 5])
    }
}
