import Foundation

public extension DefaultStringInterpolation {
    /// Hides interpolation values in non-debug modes.
    /// - Parameter value: Private value
    mutating func appendInterpolation(private value: CustomStringConvertible) {
        #if DEBUG
            appendInterpolation(value)
        #else
            appendInterpolation("{Private<\(type(of: value))>}")
        #endif
    }
}
