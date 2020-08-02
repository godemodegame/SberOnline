import UIKit

final class AnswerController: UIViewController, ViewSpecificController {
    
    // MARK: - AssociatedType
    
    typealias RootView = AnswerView
    
    // MARK: - Private Properties
    
    var presenter: AnswerViewOutput?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = AnswerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        title = "Answer"
        view().continueButton.addTarget(self, action: #selector(continueButtonTapped(_:)), for: .touchUpInside)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle(keyboardShowNotification:)),
                                               name: AnswerController.keyboardWillShowNotification,
                                               object: nil)
    }
    
    @objc private func continueButtonTapped(_ sender: UIButton) {
        presenter?.continueButtonTapped()
    }
    
    @objc private func handle(keyboardShowNotification notification: Notification) {
        if let userInfo = notification.userInfo,
            let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            view().keyboardHeight = keyboardRectangle.height
            view.layoutSubviews()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: AnswerController.keyboardWillShowNotification, object: nil)
    }
}

// MARK: - AnswerViewInput

extension AnswerController: AnswerViewInput {
    
}
