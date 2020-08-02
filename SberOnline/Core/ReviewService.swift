final class ReviewServiceAssembly {
    static func assembleModule() -> ReviewServiceProtocol {
        ReviewService(reviewApi: ReviewApiAssembly.assembleModule())
    }
}

protocol ReviewServiceProtocol: AnyObject {
    func obtainReviews(completionHandler: @escaping (Result<[Review], Error>) -> Void)
    func refresh(completion: @escaping (Result<[Review], Error>) -> Void)
    func sort(tag: Tag?) -> [Review]
}

final class ReviewService: ReviewServiceProtocol {
    let reviewApi: ReviewApiProtocol
    
    init(reviewApi: ReviewApiProtocol) {
        self.reviewApi = reviewApi
    }
    
    static var reviews: [Review] = []
    
    func obtainReviews(completionHandler: @escaping (Result<[Review], Error>) -> Void) {
        guard ReviewService.reviews.isEmpty else { completionHandler(.success(ReviewService.reviews)); return }
        refresh(completion: completionHandler)
    }
    
    func refresh(completion: @escaping (Result<[Review], Error>) -> Void) {
        ReviewService.reviews = []
        
        reviewApi.fetchReviews { result in
            switch result {
            case .success(let reviews):
                ReviewService.reviews = reviews
                completion(.success(reviews))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func sort(tag: Tag?) -> [Review] {
        guard let tag = tag else { return ReviewService.reviews }
        return ReviewService.reviews.filter { $0.tags.contains(tag) }
    }
}
