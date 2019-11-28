import Foundation

public struct Regex {
    // MARK: - Convenience Patterns

    public static let integers = Regex(pattern: #"(-?\d+)"#)

    // MARK: - Properties

    private let pattern: NSRegularExpression?

    // MARK: - Initializers

    public init(pattern: String, options: NSRegularExpression.Options = []) {
        self.pattern = try? NSRegularExpression(pattern: pattern, options: options)
    }

    // MARK: - API

    public func matches(_ string: String) -> Bool {
        guard let pattern = pattern else { return false }

        let range = NSRange(location: 0, length: string.utf16.count)
        return pattern.numberOfMatches(in: string, options: [.withTransparentBounds], range: range) > 0
    }

    public func match(_ string: String) -> RegexMatch? {
        guard let pattern = pattern else { return nil }

        let range = NSRange(location: 0, length: string.utf16.count)
        guard let match = pattern.firstMatch(in: string, options: [.withTransparentBounds], range: range) else { return nil }
        return RegexMatch(result: match, source: string)
    }

    public func matches(in string: String) -> [RegexMatch] {
        var matches = [RegexMatch]()

        let range = NSRange(location: 0, length: string.utf16.count)
        pattern?.enumerateMatches(in: string, options: [], range: range) { result, flags, stop in
            if let result = result {
                let match = RegexMatch(result: result, source: string)
                matches.append(match)
            }
        }

        return matches
    }
}

// MARK: - ExpressibleByStringLiteral

extension Regex: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) { self.init(pattern: value) }
    public init(extendedGraphemeClusterLiteral value: String) { self.init(pattern: value) }
    public init(unicodeScalarLiteral value: String) { self.init(pattern: value) }
}

// MARK: - RegexMatch

public struct RegexMatch {
    private let matches: [String?]

    fileprivate init(result: NSTextCheckingResult, source: String) {
        let nsSource = source as NSString

        var matches = [String?]()
        for i in 0..<result.numberOfRanges {
            let r = result.range(at: i)
            if r.location == NSNotFound {
                matches.append(nil)
            } else {
                matches.append(nsSource.substring(with: r))
            }
        }

        self.matches = matches
    }

    public subscript(index: Int) -> String? {
        matches[index]
    }

    public func int(_ index: Int) -> Int? {
        guard let string = self[index] else { return nil }
        return Int(string)
    }
}

// MARK: - Operator Overloads

public func ~= (left: Regex, right: String) -> Bool {
    left.matches(right)
}

public func ~= (left: Regex, right: String) -> RegexMatch? {
    left.match(right)
}

// MARK: - Foundation Extensions

public extension String {
    func match(_ pattern: String) -> RegexMatch {
        let regex = Regex(pattern: pattern)
        return regex.match(self)!
    }

    func match(_ regex: Regex) -> RegexMatch {
        regex.match(self)!
    }
}
