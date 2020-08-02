import SwiftUI

struct Bar: View {
    var tag: Tag
    var heightMultiply: CGFloat
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 30, height: 200)
                    .foregroundColor(Color.gray.opacity(0.3))
                Capsule()
                    .frame(width: 30, height: 200 * heightMultiply)
                    .foregroundColor(Color(tag.color))
            }
            
            Text(tag.text)
        }
    }
}
