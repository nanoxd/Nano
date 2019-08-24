struct Nano {
    var text = "Hello, World!"
}

// MARK: - Free Functions

/// Returns a function which ignores its argument and returns `x` instead.
public func constant<T, U>(_ x: T) -> (U) -> T {
    return { _ in x }
}

/// The identity function; returns its argument.
public func identity<T>(_ x: T) -> T {
    return x
}
