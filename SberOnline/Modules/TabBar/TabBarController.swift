import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        let reviews = UINavigationController(rootViewController: ReviewsListAssembly.assembleModule())
        reviews.tabBarItem.image = UIImage(systemName: "doc.text.fill")
        reviews.tabBarItem.title = "Reviews"
        
        let stats = StatsAssembly.assembleModule()
        stats.tabBarItem.image = UIImage(systemName: "flame.fill")
        stats.tabBarItem.title = "Stats"
        
        viewControllers = [reviews, stats]
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        TabBarTransition(viewControllers: tabBarController.viewControllers)
    }
}
