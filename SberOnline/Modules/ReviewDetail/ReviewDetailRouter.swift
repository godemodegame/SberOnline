protocol ReviewDetailRouterInput: AnyObject {
    func openAnswer()
}

final class ReviewDetailRouter {

    // MARK: - Private properties

    private weak var view: ModuleTransitionHandler?

    // MARK: - Init

    init(view: ModuleTransitionHandler) {
        self.view = view
    }
}

extension ReviewDetailRouter: ReviewDetailRouterInput {
    func openAnswer() {
        view?.push(moduleType: AnswerAssembly.self)
    }
}
