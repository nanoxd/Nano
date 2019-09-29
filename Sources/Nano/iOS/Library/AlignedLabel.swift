import Foundation

/// Custom label that can vertically align text
#if canImport(UIKit)
    import UIKit

    public class AlignedLabel: UILabel {
        public override func drawText(in rect: CGRect) {
            var rect = rect
            let fittedSize = sizeThatFits(rect.size)

            if contentMode == .top {
                rect.size.height = min(rect.size.height, fittedSize.height)
            } else if contentMode == .bottom {
                rect.origin.y = max(0, rect.size.height - fittedSize.height)
                rect.size.height = min(rect.size.height, fittedSize.height)
            }

            super.drawText(in: rect)
        }
    }
#endif
