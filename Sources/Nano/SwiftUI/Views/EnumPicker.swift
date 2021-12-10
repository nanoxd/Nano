import Foundation
import SwiftUI

/// Creates a picker from an enumeration.
///
/// ```swift
/// enum State: String, CaseIterable {
///     case CA, NY, WA
/// }
///
/// struct ContentView: View {
///     @State private var state = State.CA
///
///     var body: some View {
///         EnumPicker(selected: $state)
///     }
/// }
/// ```
struct EnumPicker<Element: Hashable & RawRepresentable & CaseIterable>: View where Element.RawValue == String {
    @Binding var selected: Element
    var title = ""

    var body: some View {
        Picker(selection: $selected, label: Text(title)) {
            ForEach(Array(Element.allCases), id: \.rawValue) {
                Text($0.rawValue).tag($0)
            }
        }
    }
}
