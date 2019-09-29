/// Returns a function which ignores its argument and returns `x` instead.
public func constant<T, U>(_ x: T) -> (U) -> T {
    return { _ in x }
}

/// The identity function; returns its argument.
public func identity<T>(_ x: T) -> T {
    return x
}

/// Configures a given value via closure. Useful to avoid the `lazy var` dance.
func with<T>(_ value: T, configuration: (inout T) throws -> Void) rethrows -> T {
    var mutable = value
    try configuration(&mutable)
    return mutable
}
