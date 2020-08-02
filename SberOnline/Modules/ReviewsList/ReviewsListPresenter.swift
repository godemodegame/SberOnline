import Foundation // swiftlint:disable:this foundation_using

protocol ReviewsListViewOutput: ViewOutput {
    func tapped(on review: Review)
    func tappedOnSort()
    func pullToRefresh()
}

final class ReviewsListPresenter: ReviewsListViewOutput {
    
    weak var view: ReviewsListViewInput?
    var router: ReviewsListRouterInput?
    
    let reviewService: ReviewServiceProtocol
    
    init(reviewService: ReviewServiceProtocol) {
        self.reviewService = reviewService
    }
    
    // MARK: - ReviewsListViewOutput
    
    func viewDidLoad() {
        reviewService.obtainReviews { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let reviews): self?.view?.display(reviews: reviews)
                case .failure(let error): print(error)
                }
            }
        }
    }
    
    func pullToRefresh() {
        reviewService.refresh { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let reviews): self?.view?.display(reviews: reviews)
                case .failure(let error): print(error)
                }
            }
        }
    }
    
    func tappedOnSort() {
        router?.openCategoryList(sort: sort)
    }
    
    func tapped(on review: Review) {
        router?.openDetail(review)
    }
    
    func sort(tag: Tag?) {
        view?.display(reviews: reviewService.sort(tag: tag))
    }
}

protocol ReviewsListViewInput: AnyObject {
    func display(reviews: [Review])
}
