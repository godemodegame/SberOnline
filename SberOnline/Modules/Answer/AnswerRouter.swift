protocol AnswerRouterInput: AnyObject {
    func close()
}

final class AnswerRouter {

    // MARK: - Private properties

    private weak var view: ModuleTransitionHandler?

    // MARK: - Init

    init(view: ModuleTransitionHandler) {
        self.view = view
    }
}

extension AnswerRouter: AnswerRouterInput {
    func close() {
        view?.popViewController()
    }
}
