import SwiftUI

public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }

    /// Conditionally modifies the `View` iff `condition` is true
    /// - [Original Source](https://swiftui-lab.com/view-extensions-for-better-code-readability/)
    func conditionalModifier<T>(
        _ condition: @autoclosure () -> Bool,
        _ modifier: T
    ) -> some View where T: ViewModifier {
        Group {
            if condition() {
                self.modifier(modifier)
            } else {
                self
            }
        }
    }

    /// Conditionally modifies the `View`, depending on whether `condition` is `true` or `false`
    /// - [Original Source](https://swiftui-lab.com/view-extensions-for-better-code-readability/)
    func conditionalModifier<M1, M2>(
        _ condition: @autoclosure () -> Bool,
        _ trueModifier: M1,
        _ falseModifier: M2
    ) -> some View where M1: ViewModifier, M2: ViewModifier {
        Group {
            if condition() {
                self.modifier(trueModifier)
            } else {
                self.modifier(falseModifier)
            }
        }
    }
}
