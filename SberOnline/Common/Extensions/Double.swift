import Foundation // swiftlint:disable:this foundation_using

extension Double {
    static func randomColorRGB() -> Double {
        return Double(arc4random()) / Double(UInt32.max)
    }
}
