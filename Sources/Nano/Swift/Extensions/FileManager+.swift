import Foundation

public extension FileManager {
    enum FileSizeMagnitude: Int {
        case byte = 0
        case kilobyte = 3
        case megabyte = 6
        case gigabyte = 9
    }

    /// Perform size conversion
    static func convert(
        fileSize: Double,
        from magnitude: FileSizeMagnitude,
        to toMagnitude: FileSizeMagnitude
    ) -> Double {
        let byteSize = fileSize * pow(10.0, Double(magnitude.rawValue))
        let newSize = byteSize / pow(10.0, Double(toMagnitude.rawValue))
        return Double(newSize)
    }
}
