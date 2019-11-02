import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct RemoteImage: SwiftUI.View {
    @State var image: UXImage? = nil

    private let imageLoader = ImageLoader()
    private let placeholderView: AnyView
    private let url: URL

    init(url: URL, placeholderView: AnyView) {
        self.url = url
        self.placeholderView = placeholderView
    }

    var body: some View {
        Group { makeContent() }
            .onReceive(imageLoader.objectWillChange, perform: { image in
                self.image = image
            })
            .onAppear(perform: {
                self.imageLoader.load(url: self.url)
            })
            .onDisappear(perform: {
                self.imageLoader.cancel()
            })
    }

    private func makeContent() -> some View {
        guard let image = image else {
            return placeholderView
        }

        return makeImage(image: image)
            .styleFit()
            .eraseToAnyView()
    }

    private func makeImage(image: UXImage) -> Image {
        #if canImport(UIKit)
            return Image(uiImage: image)
        #elseif canImport(AppKit)
            return Image(nsImage: image)
        #else
            return Image(uiImage: image)
        #endif
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
private struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(
            url: URL(string: "https://via.placeholder.com/150C")!,
            placeholderView: Text("No Image").eraseToAnyView()
        )
    }
}
