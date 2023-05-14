import Foundation

// MARK: - Declarations

/// A type that provides a default value for use in automatic nil-coalescing
/// operations.
public protocol Defaultable {
    /// The value used when this instance is `nil`.
    ///
    /// - Important: This property should be stable, and accessing it should not
    ///   result in major side effects. It is recommended to declare it as a
    ///   constant whenever possible.
    static var defaultValue: Self { get }
}

postfix operator .?

/// Performs an automatic nil-coalescing operation, returning the wrapped value
/// of an `Optional` instance or the type's default value.
///
/// An automatic nil-coalescing operation unwraps the operand if it has a value,
/// or it returns the type's default value. The result of this operation will have
/// the non-optional type of the operand's `Wrapped` type.
///
/// This operator uses short-circuit evaluation: `optional` is checked first,
/// and `T.defaultValue` is evaluated only if `optional` is `nil`. For example:
///
///     let goodNumber = Int("100").?
///     // goodNumber == 100
///
///     let notSoGoodNumber = Int("invalid-input").?
///     // notSoGoodNumber == 0
///
/// In this example, `goodNumber` is assigned a value of `100` because
/// `Int("100")` succeeded in returning a non-`nil` result. When
/// `notSoGoodNumber` is initialized, `Int("invalid-input")` fails and returns
/// `nil`, and so `T.defaultValue` is accessed to supply a default value.
///
/// - Parameter optional: An optional value.
///
/// - Returns: If `optional` is not `nil`, the unwrapped value of `optional`;
///   otherwise, the type's default value.
@inlinable public postfix func .? <T: Defaultable>(_ optional: T?) -> T {
    optional ?? .defaultValue
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
extension Double:           Defaultable { public static let defaultValue: Self = zero            }
extension Decimal:          Defaultable { public static let defaultValue: Self = zero            }
extension CGFloat:          Defaultable { public static let defaultValue: Self = zero            }
extension Duration:         Defaultable { public static let defaultValue: Self = zero            }

#if arch(arm) || arch(arm64)
extension Float16:          Defaultable { public static let defaultValue: Self = zero            }
#elseif arch(i386) || arch(x86_64)
extension Float80:          Defaultable { public static let defaultValue: Self = zero            }
#endif

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
