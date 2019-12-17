import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension Alignment {
    public func isAligned(to edge: Edge) -> Bool {
        switch edge {
        case .top:
            return vertical == .top
        case .leading:
            return horizontal == .leading
        case .bottom:
            return vertical == .bottom
        case .trailing:
            return horizontal == .trailing
        }
    }

    public func isAligned(to edges: [Edge]) -> Bool {
        edges.map(isAligned(to:)).reduce(true) { $0 && $1 }
    }
}
