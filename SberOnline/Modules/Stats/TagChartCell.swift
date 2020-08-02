import SwiftUI

struct TagChartCell: View {
    
    let tag: Tag
    
    var body: some View {
        HStack {
            Color(tag.color)
                .frame(width: 15, height: 15)
            
            Text(tag.text)
        }
    }
}
