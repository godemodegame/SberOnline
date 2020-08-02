protocol AnswerViewOutput: ViewOutput {
    func continueButtonTapped()
}

final class AnswerPresenter: AnswerViewOutput {

    weak var view: AnswerViewInput?
    var router: AnswerRouterInput?

    // MARK: - AnswerViewOutput
    
    func continueButtonTapped() {
        router?.close()
    }
}

protocol AnswerViewInput: AnyObject {

}
