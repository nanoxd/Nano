import Foundation

public extension CGSize {
    /// Calculates the largest dimensions of given aspect ratio that can fit within given constraint size.
    /// - Parameter otherSize: Constraining size to fit input into
    /// - Returns: CGSize the input must be scaled down to to fit
    func aspectFit(within otherSize: CGSize) -> CGSize {
        // if it already fits, then no change needed
        if width <= otherSize.width, height <= otherSize.height {
            return self
        }

        // if it's wider than it is tall
        if width > height {
            return CGSize(width: otherSize.width, height: floor(height * (otherSize.width / width)))
        }

        // if it's square or taller than it is wide
        return CGSize(width: floor(width * (otherSize.height / height)), height: otherSize.height)
    }
}
