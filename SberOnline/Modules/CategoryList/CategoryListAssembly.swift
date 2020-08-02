import UIKit

final class CategoryListAssembly: Assembly {
    
    struct Model: TransitionModel {
        var onSelect: ((Tag?) -> Void)
    }
    
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        guard let model = model as? Model else { fatalError("wrong model for CategoryListAssembly") }
        
        let view = CategoryListController()
        view.onSelect = model.onSelect
        view.modalPresentationStyle = .overCurrentContext
        return view
    }
}
