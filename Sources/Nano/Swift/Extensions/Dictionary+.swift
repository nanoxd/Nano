import Foundation

// MARK: -

public extension Dictionary {
    /// Maps values using transform function into a new dictionary
    /// - Parameter transform: The transform function
    func compactMapValues<T>(_ transform: (Value) throws -> T?) rethrows -> [Key: T] {
        try reduce(into: [Key: T]()) { result, x in
            if let value = try transform(x.value) {
                result[x.key] = value
            }
        }
    }

    /// Returns a dictionary containing the results of mapping the given closure
    /// over the sequence's key value pairs.
    ///
    /// In this example, `mapPairs` is used to convert the parameter dictionary keys
    /// to their corresponding raw values.
    ///
    /// ```swift
    /// enum Keys: String {
    ///     case name = "full_name"
    ///     case age
    ///     case language
    /// }
    ///
    /// var parameter: [Keys: Any] = [
    ///     .name: "Vivien",
    ///     .age: 21,
    ///     .language: "English"
    /// ]
    ///
    /// let result = parameter.mapPairs { ($0.key.rawValue, $0.value) }
    ///
    /// //  'result' [String: Any] = [
    /// //     "full_name": "Vivien",
    /// //     "age": 21,
    /// //     "language": "English"
    /// // ]
    /// ```
    ///
    /// - Parameter transform: A mapping closure. `transform` accepts an
    ///                        element of this sequence as its parameter and returns
    ///                        a transformed value of the same or of a different
    ///                        type.
    /// - Returns: A dictionary containing the transformed key value pairs.
    func mapPairs<K: Hashable, T>(_ transform: (Element) throws -> (K, T)) rethrows -> [K: T] {
        [K: T](uniqueKeysWithValues: try map(transform))
    }
}
