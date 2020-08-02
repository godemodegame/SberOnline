import Foundation // swiftlint:disable:this foundation_using
import Combine

final class StatsViewModel: ObservableObject {
    @Published var pieChartData = PieChartData(data: [1], colors: [.red])
    
    @Published var tags: [Tag] = [.bug] {
        didSet {
            pieChartData = PieChartData(data: Tag.allCases.map { tag in
                Double(tags.filter { $0 == tag }.count)
            }, colors: Tag.allCases.map { $0.color })
        }
    }
    
    let reviewService: ReviewServiceProtocol
    
    init(reviewService: ReviewServiceProtocol) {
        self.reviewService = reviewService
    }
    
    func obtainReviews() {
        reviewService.obtainReviews { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let reviews): self?.tags = reviews.flatMap { $0.tags }
                case .failure: self?.tags = []
                }
            }
        }
    }
}
