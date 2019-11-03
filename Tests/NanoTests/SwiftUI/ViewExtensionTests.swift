@testable import Nano
import SwiftUI
import XCTest

/* Uncomment when SwiftUI unit testing is more baked in
 @available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
 private struct LargeBlueTitleModifier: ViewModifier {
 func body(content: Content) -> some View {
     return content
         .font(.largeTitle)
         .foregroundColor(.blue)
 }
 }

 @available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
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
