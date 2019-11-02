import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public extension SwiftUI.View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
