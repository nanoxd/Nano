#if canImport(UIKit)
    import SwiftUI
    import UIKit

    struct VisualEffectView: UIViewRepresentable {
        typealias UIViewType = UIVisualEffectView
        var style: UIBlurEffect.Style

        func makeUIView(context: UIViewRepresentableContext<VisualEffectView>) -> UIVisualEffectView {
            UIVisualEffectView(effect: UIBlurEffect(style: style))
        }

        func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<VisualEffectView>) {}
    }
#endif
