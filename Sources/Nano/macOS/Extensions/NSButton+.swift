#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit

    public extension NSButton {
        func stylePlain(title: String, color: NSColor, font: NSFont) {
            attributedTitle = NSAttributedString(string: title, attributes: [
                .foregroundColor: color,
                .font: font,
            ])

            isBordered = false
            setButtonType(.momentaryChange)
        }

        func stylePlain(imageName: String) {
            isBordered = false
            image = NSImage(named: NSImage.Name(imageName))
            imageScaling = .scaleProportionallyUpOrDown
        }

        var isOn: Bool {
            get { state == .on ? true : false }
            set { state = newValue ? .on : .off }
        }
    }

#endif
