#if canImport(AppKit) && !targetEnvironment(macCatalyst)
    import AppKit
    public extension NSImage {
        /// Adapted from https://gist.github.com/DennisWeidmann/7c4b4bb72062bd1a40c714aa5d95a0d7
        var pixelBuffer: CVPixelBuffer? {
            let width = size.width
            let height = size.height
            let attrs = [
                kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
                kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue,
            ] as CFDictionary

            var pixelBuffer: CVPixelBuffer?
            let status = CVPixelBufferCreate(
                kCFAllocatorDefault,
                Int(width),
                Int(height),
                kCVPixelFormatType_32ARGB,
                attrs,
                &pixelBuffer
            )

            guard let resultPixelBuffer = pixelBuffer else { return nil }
            guard status == kCVReturnSuccess else { return nil }

            CVPixelBufferLockBaseAddress(resultPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
            let pixelData = CVPixelBufferGetBaseAddress(resultPixelBuffer)

            let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
            let coreGraphicsContext = CGContext(
                data: pixelData,
                width: Int(width),
                height: Int(height),
                bitsPerComponent: 8,
                bytesPerRow: CVPixelBufferGetBytesPerRow(resultPixelBuffer),
                space: rgbColorSpace,
                bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue
            )

            guard let context = coreGraphicsContext else { return nil }

            context.translateBy(x: 0, y: height)
            context.scaleBy(x: 1.0, y: -1.0)

            let graphicsContext = NSGraphicsContext(cgContext: context, flipped: false)
            NSGraphicsContext.saveGraphicsState()
            NSGraphicsContext.current = graphicsContext
            draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            NSGraphicsContext.restoreGraphicsState()

            CVPixelBufferUnlockBaseAddress(resultPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))

            return resultPixelBuffer
        }
    }
#endif
