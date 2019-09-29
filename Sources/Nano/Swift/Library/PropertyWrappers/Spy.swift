import Foundation

/// Observes changes to a value over time.
@propertyWrapper
public struct Spy<Value> {
    // MARK: - Properties

    public private(set) var value: Value
    public private(set) var history: [Value] = []

    // MARK: - Initializers

    public init(wrappedValue: Value) {
        value = wrappedValue
    }

    // MARK: - @propertyWrapper

    public var wrappedValue: Value {
        get { value }
        set {
            history.append(newValue)
            value = newValue
        }
    }

    public var projectedValue: Self {
        get { self }
        set { self = newValue }
    }
}
