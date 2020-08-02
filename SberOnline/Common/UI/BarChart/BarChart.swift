import SwiftUI

struct BarChart: View {
    
    @Binding var tags: [Tag]
    
    var body: some View {
        HStack {
            ForEach(Tag.allCases, id: \.self) { tag in
                Bar(tag: tag, heightMultiply: CGFloat(self.tags.filter { $0 == tag }.count) / CGFloat(self.tags.count))
            }
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    
    @State static var tags: [Tag] = [.bug, .bug, .defect, .bug]
    
    static var previews: some View {
        BarChart(tags: $tags)
    }
}
