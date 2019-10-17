import Foundation

/// Runtime Fatal Error w/ Reason
public struct FatalReason {
    /// An underlying string-based cause for a fatal error.
    public let reason: String

    /// Establishes a new instance of a `FatalReason` with a string-based explanation.
    public init(_ reason: String) {
        self.reason = reason
    }
}

// MARK: - CustomStringConvertible

extension FatalReason: CustomStringConvertible {
    public var description: String {
        reason
    }
}

// MARK: - ExpressibleByStringLiteral

extension FatalReason: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

// MARK: - Reasons

public extension FatalReason {
    static let subclassMustImplement: FatalReason = "Must be implemented by subclass."

    static func unknownCaseDetected<T: RawRepresentable>(_ case: T) -> FatalReason {
        FatalReason("Unknown case detected: \(`case`) - (\(`case`.rawValue))")
    }

    static func dequeueFailed(for name: String, identifier: String) -> FatalReason {
        FatalReason("Failed to dequeue \(name) with identifier: \(identifier)")
    }

    static func dequeueFailed(for name: String, kind: String, indexPath: IndexPath) -> FatalReason {
        FatalReason("Failed to dequeue \(name) for kind: \(kind) at indexPath(\(indexPath.section), \(indexPath.item))")
    }
}

// MARK: - Fatal Error

/// Unconditionally prints a given message and stops execution.
///
/// - Parameters:
///   - reason: A predefined `FatalReason`.
///   - function: The name of the calling function to print with `message`. The
///     default is the calling scope where `fatalError(because:, function:, file:, line:)`
///     is called.
///   - file: The file name to print with `message`. The default is the file
///     where `fatalError(because:, function:, file:, line:)` is called.
///   - line: The line number to print along with `message`. The default is the
///     line number where `fatalError(because:, function:, file:, line:)` is called.
@_transparent
public func fatalError(
    because reason: FatalReason,
    function: StaticString = #function,
    file: StaticString = #file,
    line: UInt = #line
) -> Never {
    fatalError("\(function): \(reason)", file: file, line: line)
}
