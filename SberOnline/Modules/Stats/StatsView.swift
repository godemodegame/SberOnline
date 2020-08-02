import SwiftUI

struct StatsView: View {
    
    @ObservedObject var viewModel = StatsViewModel(reviewService: ReviewServiceAssembly.assembleModule())
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    PieChart(pieChartData: $viewModel.pieChartData)
                        .frame(width: 200, height: 200, alignment: .center)
                    
                    VStack(alignment: .leading) {
                        ForEach(Tag.allCases, id: \.self) { tag in
                            TagChartCell(tag: tag)
                        }
                    }
                }.padding(.top)
                
                BarChart(tags: $viewModel.tags)
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding(.top)
                
                Spacer()
            }.navigationBarTitle("Stats")
        }.onAppear {
            self.viewModel.obtainReviews()
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
