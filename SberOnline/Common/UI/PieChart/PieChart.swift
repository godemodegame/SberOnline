import SwiftUI

struct PieChart: View {
    @Binding var pieChartData: PieChartData
    
    var body: some View {
        GeometryReader { geometry in
            self.makePieChart(geometry, pieChartData: self.pieChartData.data)
        }
    }
    
    func makePieChart(_ geometry: GeometryProxy, pieChartData: [SlideData]) -> some View {
        let chartSize = min(geometry.size.width, geometry.size.height)
        let radius = chartSize / 2
        
        return ZStack {
            ForEach(0..<pieChartData.count, id: \.self) { index in
                PieChartSlide(geometry: geometry, slideData: pieChartData[index], index: index)
            }
            ForEach(pieChartData) { slideData in
                Text("\(slideData.annotation)%")
                    .foregroundColor(Color.white)
                    .bold()
                    .position(CGPoint(x: radius + slideData.annotationDeltaX*radius,
                                      y: radius + slideData.annotationDeltaY*radius))
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    @State static var pieChartData = PieChartData(data: [1, 2, 3], colors: [.green, .blue, .red])
    
    static var previews: some View {
        PieChart(pieChartData: $pieChartData)
    }
}
