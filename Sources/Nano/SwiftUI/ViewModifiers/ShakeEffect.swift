import SwiftUI

// https://learntalks.com/FrenchKit/2019/FrenchKit-2019-Animations-with-SwiftUI-Chris-Eidhof/
public struct ShakeEffect: GeometryEffect {
    var position: CGFloat = 0

    public var animatableData: CGFloat {
        get { position }
        set { position = newValue }
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(translationX: sin(position * 2 * .pi), y: 0)
        )
    }
}
