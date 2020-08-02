import UIKit

final class AnswerAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = AnswerController()
        let presenter = AnswerPresenter()
        let router = AnswerRouter(view: view)

        view.presenter = presenter
        presenter.view = view
        presenter.router = router

        return view
    }
}
