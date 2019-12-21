import Foundation

public extension Date {
    /// Epoch in milliseconds.
    ///
    /// Epoch, also known as Unix timestamps, is the number of seconds
    /// (not milliseconds) that have elapsed since January 1, 1970 at 00:00:00 GMT
    /// (1970-01-01 00:00:00 GMT).
    var unixTimeMilliseconds: Int64 {
        Int64(timeIntervalSince1970 * 1000)
    }
}
