import UIKit

final class ReviewsListAssembly: Assembly {    
    static func assembleModule() -> UIViewController {
        let view = ReviewsListController()
        let presenter = ReviewsListPresenter(reviewService: ReviewServiceAssembly.assembleModule())
        let router = ReviewsListRouter(view: view)

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
