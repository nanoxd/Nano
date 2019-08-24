import Foundation

public extension Data {
    // MARK: - Hex Encoding

    struct HexEncodingOptions: OptionSet {
        // MARK: - Options

        public static let upperCase = HexEncodingOptions(rawValue: 1 << 0)

        public let rawValue: Int

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

    /// Converts data into a hexadecimal representation.
    ///
    /// - Parameter options: Options to change the output
    /// - Returns: A hexadecimal string representation of the current data.
    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return map { String(format: format, $0) }.joined()
    }
}
