@testable import Nano
import SwiftUI
import XCTest

/* Uncomment when SwiftUI unit testing is more baked in
 private struct LargeBlueTitleModifier: ViewModifier {
 func body(content: Content) -> some View {
     return content
         .font(.largeTitle)
         .foregroundColor(.blue)
 }
 }

 final class ViewExtensionTests: XCTestCase {
 func test_conditionalModifier_whenConditionIsMet() {
     var shouldModifyView = false
     var textView: some View = Text("test")

     var body: some View {
         textView.conditionalModifier(shouldModifyView, LargeBlueTitleModifier())
     }

     XCTAssertEqual(textView, body)

     shouldModifyView = true
     XCTAssertNotEqual(textView, body)
 }
 }
 */
