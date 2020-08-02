import UIKit

final class ReviewDetailAssembly: Assembly {
    
    struct Model: TransitionModel {
        let review: Review
    }
    
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        guard let model = model as? Model else { fatalError("Incorrect Model") }

        let view = ReviewDetailController()
        let presenter = ReviewDetailPresenter(review: model.review)
        let router = ReviewDetailRouter(view: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router

        return view
    }
}
