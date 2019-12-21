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

    /// Returns a paired sequence for `self`.
    func eachPair() -> Zip2Sequence<Self, Self.SubSequence> {
        zip(self, dropFirst())
    }

    /// Splits a collection by the predicate, pushing elements to the left if the predicate is true.
    /// - Parameter goesInFirst: Predicate to determine which values should be inserted to the left-hand array.
    func partition(by goesInFirst: (Element) -> Bool) -> ([Element], [Element]) {
        var a1 = [Element]()
        var a2 = [Element]()

        for i in self {
            if goesInFirst(i) {
                a1.append(i)
            } else {
                a2.append(i)
            }
        }

        return (a1, a2)
    }
}

// MARK: - Strideable Index

public extension Collection where Index: Strideable {
    /// Returns a lazily evaluated Sequence, yielding at the desired `step`.
    /// - Parameter step: The number of elements to offset by.
    func stride(by step: Index.Stride) -> UnfoldSequence<Element, Index> {
        stride(by: step, from: startIndex, to: endIndex)
    }

    /// Returns a lazily evaluated Sequence, yielding at the desired `step` starting from the given index.
    /// - Parameter step: The number of elements to offset by.
    /// - Parameter start: The starting index.
    func stride(by step: Index.Stride, from start: Index) -> UnfoldSequence<Element, Index> {
        stride(by: step, from: start, to: endIndex)
    }

    /// Returns a lazily evaluated Sequence, yielding at the desired `step` ending at the given end index.
    /// - Parameter step: The number of elements to offset by.
    /// - Parameter end: The ending index.
    func stride(by step: Index.Stride, to end: Index) -> UnfoldSequence<Element, Index> {
        stride(by: step, from: startIndex, to: end)
    }

    /// Returns a lazily evaluated Sequence, yielding at the desired `step` starting from the given index and ending at the given end index.
    /// - Parameter step: The number of elements to offset by.
    /// - Parameter start: The starting index.
    /// - Parameter end: The ending index.
    func stride(by step: Index.Stride, from start: Index, to end: Index) -> UnfoldSequence<Element, Index> {
        sequence(state: start, next: { state in
            guard state < end else { return nil }
            defer { state = state.advanced(by: step) }
            return self[state]
        })
    }

    /// Returns a lazily evaluated Sequence, yielding at the desired `step` through a given end index.
    /// - Parameter step: The number of elements to offset by.
    /// - Parameter end: The ending index.
    func stride(by step: Index.Stride, through end: Index) -> UnfoldSequence<Element, Index> {
        stride(by: step, from: startIndex, through: end)
    }

    /// Returns a lazily evaluated Sequence, yielding at the desired `step` starting from the given index and through the given end index.
    /// - Parameters:
    ///   - step: The number of elements to offset by.
    ///   - start: The starting index.
    ///   - end: The ending index.
    func stride(by step: Index.Stride, from start: Index, through end: Index) -> UnfoldSequence<Element, Index> {
        guard !isEmpty else {
            return sequence(state: start, next: { _ in nil })
        }

        return sequence(state: start, next: { state in
            guard state <= end else {
                return nil
            }

            defer { state = state.advanced(by: step) }
            return self[state]
        })
    }
}
