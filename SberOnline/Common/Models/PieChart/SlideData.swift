import SwiftUI

final class SlideData: Identifiable, ObservableObject {
    let id: UUID = UUID()
    var data: DataItem!
    var startAngle: Angle! = .degrees(0)
    var endAngle: Angle! = .degrees(0)
    
    
    var annotation: String! = ""
    var annotationDeltaX: CGFloat! = 0.0
    var annotationDeltaY: CGFloat! = 0.0
    
    var deltaX: CGFloat! = 0.0
    var deltaY: CGFloat! = 0.0
    
    init() { }
    
    init(startAngle: Angle, endAngle: Angle) {
        self.data = DataItem(name: "", value: 0)
        self.startAngle = startAngle
        self.endAngle = endAngle
    }
}
