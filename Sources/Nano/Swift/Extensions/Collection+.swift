import Foundation

public extension Collection {
    // MARK: Subscripts

    /// Returns `Element` at the given index if it exists.
    ///
    /// - Parameter index: Index of element.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }

    // MARK:

    /// Returns `true` if any element satisfies a given predicate.
    /// - Parameter predicate: A closure that takes an element of the sequence as its argument
    /// and returns a `Bool` that indicates whether the passed element satisfies a condition.
    /// - Returns: `true` if the sequence contains any elements that satisfy
    /// `predicate`; otherwise false.
    func anySatisfy(_ predicate: (Element) -> Bool) -> Bool {
        !allSatisfy { !predicate($0) }
    }

    /// Returns the number of elements of the sequence that satisfy the given
    /// predicate.
    ///
    /// ```swift
    /// let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    /// let shortNamesCount = cast.count { $0.count < 5 }
    /// print(shortNamesCount)
    /// // Prints "2"
    /// ```
    ///
    /// - Parameter predicate: A closure that takes an element of the sequence as
    ///                        its argument and returns a Boolean value indicating
    ///                        whether the element should be included in the
    ///                        returned count.
    /// - Returns: A count of elements that satisfy the given predicate.
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    func count(where predicate: (Element) throws -> Bool) rethrows -> Int {
        try filter(predicate).count
    }
}
