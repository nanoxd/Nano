import Foundation

/// A value that represents either a left or a right value, including an
/// associated value in each case.
public enum Either<Left, Right> {
    case left(Left)
    case right(Right)

    /// Returns the value of `Left` instances, or `nil` for `Right` instances.
    public var left: Left? {
        return either(ifLeft: Optional<Left>.some, ifRight: constant(nil))
    }

    /// Returns the value of `Right` instances, or `nil` for `Left` instances.
    public var right: Right? {
        return either(ifLeft: constant(nil), ifRight: Optional<Right>.some)
    }

    /// Returns true of `Left` instances, or false for `Right` instances.
    public var isLeft: Bool {
        return either(ifLeft: constant(true), ifRight: constant(false))
    }

    /// Returns true of `Right` instances, or false for `Left` instances.
    public var isRight: Bool {
        return either(ifLeft: constant(false), ifRight: constant(true))
    }
}

// MARK: - API

public extension Either {
    /// Returns the result of applying `ifLeft` to the value of `Left`, or
    ///  `ifRight` to the value of `Right`.
    func either<Result>(
        ifLeft: (Left) throws -> Result,
        ifRight: (Right) throws -> Result
    ) rethrows -> Result {
        switch self {
        case let .left(x):
            return try ifLeft(x)
        case let .right(x):
            return try ifRight(x)
        }
    }

    /// Maps `Right` values with `transform`, and re-wraps `Left` values.
    /// Returns a new result, mapping any right value using the given
    /// transformation.
    ///
    /// Use this method when you need to transform the value of a `Either`
    /// instance when it represents a right value. The following example transforms
    /// the integer right value of a result into a string:
    ///
    /// ```swift
    /// func getNextInteger() -> Either<Int, String> { /* ... */ }
    ///
    /// let integerResult = getNextInteger()
    /// // integerResult == .right(5)
    /// let stringResult = integerResult.map { String($0) }
    /// // stringResult == .right("5")
    /// ```
    ///
    /// - Parameter transform: A closure that takes the right value of this
    ///   instance.
    /// - Returns: An `Either` with the result of evaluating `transform`
    ///   as the new right value, if this instance represents a right value.
    func map<NewRight>(_ transform: (Right) -> NewRight) -> Either<Left, NewRight> {
        return flatMap { .right(transform($0)) }
    }

    /// Returns the result of applying `transform` to `Right` values, or re-wrapping `Left` values.
    func flatMap<NewRight>(_ transform: (Right) -> Either<Left, NewRight>) -> Either<Left, NewRight> {
        return either(
            ifLeft: Either<Left, NewRight>.left,
            ifRight: transform
        )
    }

    /// Returns a new result, mapping any left value using the given
    /// transformation.
    ///
    /// Use this method when you need to transform the value of a `Either`
    /// instance when it represents a left value. The following example transforms
    /// the integer left value of a result into a string:
    ///
    /// ```swift
    /// func getNextInteger() -> Either<Int, String> { /* ... */ }
    ///
    /// let integerResult = getNextInteger()
    /// // integerResult == .left(5)
    /// let stringResult = integerResult.mapLeft { String($0) }
    /// // stringResult == .left("5")
    /// ```
    ///
    /// - Parameter transform: A closure that takes the left value of this
    ///   instance.
    /// - Returns: A `Either` instance with the result of evaluating `transform`
    ///   as the new left value if this instance represents a left value.
    func mapLeft<NewLeft>(_ transform: (Left) -> NewLeft) -> Either<NewLeft, Right> {
        return flatMapLeft { .left(transform($0)) }
    }

    /// Returns the result of applying `transform` to `Left` values, or re-wrapping `Right` values.
    func flatMapLeft<NewLeft>(_ transform: (Left) -> Either<NewLeft, Right>) -> Either<NewLeft, Right> {
        return either(
            ifLeft: transform,
            ifRight: Either<NewLeft, Right>.right
        )
    }

    /// Maps `Left` values with `left` & maps `Right` values with `right`.
    func bimap<NewLeft, NewRight>(
        leftBy lf: (Left) -> NewLeft,
        rightBy rf: (Right) -> NewRight
    ) -> Either<NewLeft, NewRight> {
        return either(
            ifLeft: { .left(lf($0)) },
            ifRight: { .right(rf($0)) }
        )
    }
}

// MARK: - CustomStringConvertible

extension Either: CustomStringConvertible {
    public var description: String {
        return either(
            ifLeft: { ".Left(\($0))" },
            ifRight: { ".Right(\($0))" }
        )
    }
}

// MARK: - Hashable

extension Either: Hashable where Left: Hashable, Right: Hashable {}

// MARK: - Equatable

extension Either: Equatable where Left: Equatable, Right: Equatable {}
