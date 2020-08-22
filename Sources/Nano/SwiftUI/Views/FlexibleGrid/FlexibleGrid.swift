import Foundation
import SwiftUI

/// Creates a flexible grid that accomodates the size of the containing content.
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct FlexibleGrid<Data: Collection, Content: View>: View where Data.Element: Hashable {
    public let data: Data
    public let spacing: CGFloat
    public let alignment: HorizontalAlignment
    public let content: (Data.Element) -> Content
    @State private var availableWidth: CGFloat = 0

    public var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
            Color.clear
                .frame(height: 1)
                .readSize { size in
                    availableWidth = size.width
                }

            FlexibleView(
                availableWidth: availableWidth,
                data: data,
                spacing: spacing,
                alignment: alignment,
                content: content
            )
        }
    }
}

/// Lays out the elements in a grid and occupies the size required based on the parent's available width
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content

    @State private var elementsSize: [Data.Element: CGSize] = [:]

    var body: some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }

    private func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth

        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]

            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }

            remainingWidth = remainingWidth - (elementSize.width + spacing)
        }

        return rows
    }
}
