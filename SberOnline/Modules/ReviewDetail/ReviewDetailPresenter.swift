protocol ReviewDetailViewOutput: ViewOutput {
    func answerButtonTapped()
}

final class ReviewDetailPresenter: ReviewDetailViewOutput {

    weak var view: ReviewDetailViewInput?
    var router: ReviewDetailRouterInput?
    
    let review: Review
    
    init(review: Review) {
        self.review = review
    }
    
    // MARK: - ReviewDetailViewOutput
    
    func viewDidLoad() {
        view?.display(review: review)
    }
    
    func answerButtonTapped() {
        router?.openAnswer()
    }
}

protocol ReviewDetailViewInput: AnyObject {
    func display(review: Review)
}
