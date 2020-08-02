import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(red: .randomColorRGB(), green: .randomColorRGB(), blue: .randomColorRGB())
    }
}
