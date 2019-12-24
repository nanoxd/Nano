#if canImport(UIKit)
    import UIKit

    // MARK: - Hex Support

    extension UIColor {
        public convenience init(hex: Int64) {
            let (r, g, b, a) = UIColor.components(hex: hex)
            self.init(red: r, green: g, blue: b, alpha: a)
        }

        public convenience init(hex: Int64, alpha: CGFloat) {
            let (r, g, b, a) = UIColor.components(hex: hex, alpha: alpha)
            self.init(red: r, green: g, blue: b, alpha: a)
        }

        @nonobjc
        public convenience init(hex: String) {
            self.init(hex: UIColor.components(hex: hex))
        }

        @nonobjc
        public convenience init(hex: String, alpha: CGFloat) {
            self.init(hex: UIColor.components(hex: hex), alpha: alpha)
        }

        /// Returns the hex value of `self`
        public var hex: String {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

            guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
                return "#000000"
            }

            func round(_ value: CGFloat) -> Int {
                lround(Double(value) * 255)
            }

            if alpha == 1 {
                return String(format: "#%02lX%02lX%02lX", round(red), round(green), round(blue))
            } else {
                return String(format: "#%02lX%02lX%02lX%02lX", round(red), round(green), round(blue), round(alpha))
            }
        }

        private static func components(
            hex: Int64,
            alpha: CGFloat? = nil
        ) -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
            let preferredAlpha = alpha

            let r: CGFloat
            let g: CGFloat
            let b: CGFloat
            let a: CGFloat

            let isRGBA = CGFloat(hex & 0xFF00_0000) != 0

            if isRGBA {
                r = CGFloat((hex & 0xFF00_0000) >> 24) / 255
                g = CGFloat((hex & 0xFF0000) >> 16) / 255
                b = CGFloat((hex & 0xFF00) >> 8) / 255
                a = preferredAlpha ?? CGFloat(hex & 0xFF) / 255
            } else {
                r = CGFloat((hex & 0xFF0000) >> 16) / 255
                g = CGFloat((hex & 0xFF00) >> 8) / 255
                b = CGFloat(hex & 0xFF) / 255
                a = preferredAlpha ?? 1
            }

            return (r, g, b, a)
        }

        private static func components(hex: String) -> Int64 {
            var hexString = hex

            if hexString.hasPrefix("#") {
                hexString = String(hexString.dropFirst())
            }

            return Int64(hexString, radix: 16) ?? 0x000000
        }
    }

    // MARK: - Utility

    public extension UIColor {
        var alpha: CGFloat {
            get { cgColor.alpha }
            set { withAlphaComponent(newValue) }
        }

        func alpha(_ value: CGFloat) -> UIColor {
            withAlphaComponent(value)
        }
    }
#endif
