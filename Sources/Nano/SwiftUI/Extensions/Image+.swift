import SwiftUI

public extension SwiftUI.Image {
    func styleFit() -> some View {
        resizable()
            .aspectRatio(contentMode: .fit)
    }
}
