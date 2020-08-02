import UIKit

struct InitialViewControllerCommand: Command {
    let window: UIWindow?
    
    func execute() {
        window?.makeKeyAndVisible()
        window?.tintColor = .systemGreen
        window?.rootViewController = TabBarController()
            
//            UINavigationController(rootViewController: ReviewsListAssembly.assembleModule())
        
//            ReviewDetailAssembly.assembleModule(with: ReviewDetailAssembly.Model(review: Review(text: "1123",
//                                                                                                team: "12312",
//                                                                                                tags: [.bug, .defect])))
    }
}
