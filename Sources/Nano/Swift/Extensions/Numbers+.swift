import Foundation

// MARK: - SignedInteger

public extension SignedInteger {
    /// Returns the number of digits in `self`
    var digitCount: Self {
        numberOfDigits(in: self)
    }

    /// Recursive function to determine the number of digits in `number`
    /// - Parameter number: The number to count the digits of.
    private func numberOfDigits(in number: Self) -> Self {
        if abs(number) < 10 {
            return 1
        } else {
            return 1 + numberOfDigits(in: number / 10)
        }
    }
}
