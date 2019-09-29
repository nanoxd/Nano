import Foundation

public final class LimitedWorker {
    private let serialQueue = DispatchQueue(label: "me.pixelz.serial.queue")
    private let concurrentQueue = DispatchQueue(
        label: "me.pixelz.concurrent.queue",
        attributes: .concurrent
    )
    private let semaphore: DispatchSemaphore

    public init(limit: Int) {
        semaphore = DispatchSemaphore(value: limit)
    }

    public func enqueue(task: @escaping () -> Void) {
        serialQueue.async {
            self.semaphore.wait()
            self.concurrentQueue.async {
                task()
                self.semaphore.signal()
            }
        }
    }
}
