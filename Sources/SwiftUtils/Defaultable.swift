import Foundation

// MARK: - Declarations

public protocol Defaultable {
    static var defaultValue: Self { get }
}

postfix operator .?

@inlinable public postfix func .? <T: Defaultable>(_ value: T?) -> T {
    value ?? .defaultValue
}

// MARK: - Signed Integer Conformances

extension Int:              Defaultable { public static let defaultValue: Self = zero            }
extension Int8:             Defaultable { public static let defaultValue: Self = zero            }
extension Int16:            Defaultable { public static let defaultValue: Self = zero            }
extension Int32:            Defaultable { public static let defaultValue: Self = zero            }
extension Int64:            Defaultable { public static let defaultValue: Self = zero            }

// MARK: - Unsigned Integer Conformances

extension UInt:             Defaultable { public static let defaultValue: Self = zero            }
extension UInt8:            Defaultable { public static let defaultValue: Self = zero            }
extension UInt16:           Defaultable { public static let defaultValue: Self = zero            }
extension UInt32:           Defaultable { public static let defaultValue: Self = zero            }
extension UInt64:           Defaultable { public static let defaultValue: Self = zero            }

// MARK: - Floating-Point Conformances

extension Float:            Defaultable { public static let defaultValue: Self = zero            }
extension Float16:          Defaultable { public static let defaultValue: Self = zero            }
extension Double:           Defaultable { public static let defaultValue: Self = zero            }
extension Decimal:          Defaultable { public static let defaultValue: Self = zero            }
extension CGFloat:          Defaultable { public static let defaultValue: Self = zero            }
extension Duration:         Defaultable { public static let defaultValue: Self = zero            }

// MARK: - String Conformances

extension String:           Defaultable { public static let defaultValue: Self = ""              }
extension StaticString:     Defaultable { public static let defaultValue: Self = "" as Self      }
extension AttributedString: Defaultable { public static let defaultValue: Self = Self("")        }

// MARK: - Collection Conformances

extension Array:            Defaultable { public static var defaultValue: Self { []            } }
extension Dictionary:       Defaultable { public static var defaultValue: Self { [:]           } }
extension Set:              Defaultable { public static var defaultValue: Self { Self([])      } }
extension EmptyCollection:  Defaultable { public static var defaultValue: Self { Self()        } }
extension KeyValuePairs:    Defaultable { public static var defaultValue: Self { [:] as Self   } }

// MARK: - Other Conformances

extension Bool:             Defaultable { public static let defaultValue: Self = false           }
extension Data:             Defaultable { public static let defaultValue: Self = Self()          }
extension Date:             Defaultable { public static let defaultValue: Self = referenceDate   }
extension NSPoint:          Defaultable { public static let defaultValue: Self = NSZeroPoint     }
extension NSSize:           Defaultable { public static let defaultValue: Self = NSZeroSize      }
extension NSRect:           Defaultable { public static let defaultValue: Self = NSZeroRect      }
