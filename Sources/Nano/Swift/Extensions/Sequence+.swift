import Foundation

public extension Sequence {
    /// Given a `Sequence`, return a new sequence that when iterated contains `newValue`
    ///  in between each of the elements of the original sequence
    ///
    ///     [1, 2, 3].interspersed(88)
    ///     // [1, 88, 2, 88, 3]
    ///
    /// - Parameter newValue: Value to intersperse throughout the original collection
    /// - Returns: A new `Sequence` with `newValue` interspersed between each original element
    func interspersed(_ newValue: Element) -> AnySequence<Element> {
        return AnySequence { () -> AnyIterator<Element> in
            var iterator = self.makeIterator()
            var intersperse = false
            var lastValue = iterator.next()

            return AnyIterator {
                defer { intersperse.toggle() }
                if intersperse, lastValue != nil {
                    return newValue
                } else {
                    defer { lastValue = iterator.next() }
                    return lastValue
                }
            }
        }
    }

    /// Returns an array containing, in order, the elements of the sequence
    /// that do not satisfy the given predicate.
    ///
    /// In this example, `reject(_:)` is used to include only names longer than
    /// five characters.
    ///
    ///     let cast = ["Vivien", "Marlon", "Kim", "Karl"]
    ///     let longNames = cast.reject { $0.count < 5 }
    ///     print(longNames)
    ///     // Prints "["Vivien", "Marlon"]"
    ///
    /// - Parameter isNotIncluded: A closure that takes an element of the
    ///   sequence as its argument and returns a Boolean value indicating
    ///   whether the element should not be included in the returned array.
    /// - Returns: An array of the elements that `isNotIncluded` allowed.
    ///
    /// - Complexity: O(*n*), where *n* is the length of the sequence.
    @inlinable func reject(
        _ isNotIncluded: (Element) throws -> Bool
    ) rethrows -> [Element] {
        return try filter { try !isNotIncluded($0) }
    }
}

// MARK: - Sequence + Numeric

public extension Sequence {
    func sum<T: Numeric>(for keyPath: KeyPath<Element, T>) -> T {
        return reduce(0) { sum, element in
            sum + element[keyPath: keyPath]
        }
    }
}

public extension Sequence where Element: Numeric {
    /// Adds all elements in `Sequence`.
    func sum() -> Element {
        return reduce(0, +)
    }
}
