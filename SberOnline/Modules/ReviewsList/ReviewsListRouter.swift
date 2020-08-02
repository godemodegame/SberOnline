protocol ReviewsListRouterInput: AnyObject {
    func openDetail(_ review: Review)
    func openCategoryList(sort: @escaping (Tag?) -> Void)
}

final class ReviewsListRouter {

    // MARK: - Private properties

    private weak var view: ModuleTransitionHandler?

    // MARK: - Init

    init(view: ModuleTransitionHandler) {
        self.view = view
    }
}

extension ReviewsListRouter: ReviewsListRouterInput {
    func openDetail(_ review: Review) {
        view?.push(with: ReviewDetailAssembly.Model(review: review), moduleType: ReviewDetailAssembly.self)
    }
    
    func openCategoryList(sort: @escaping (Tag?) -> Void) {
        view?.present(with: CategoryListAssembly.Model(onSelect: sort), moduleType: CategoryListAssembly.self)
    }
}
