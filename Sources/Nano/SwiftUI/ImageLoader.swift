import Combine
import Foundation

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public class ImageLoader: ObservableObject {
    private var cancellable: AnyCancellable?
    public let objectWillChange = PassthroughSubject<UXImage?, Never>()

    public func load(url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .map { UXImage(data: $0) }
            .receive(on: RunLoop.main)
            .replaceError(with: nil)
            .eraseToAnyPublisher()
            .sink(receiveValue: { image in
                self.objectWillChange.send(image)
            })
    }

    public func cancel() {
        cancellable?.cancel()
    }
}
