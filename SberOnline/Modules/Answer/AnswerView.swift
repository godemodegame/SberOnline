import UIKit
import Nibless

final class AnswerView: NLView {
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16)
        textView.backgroundColor = .clear
        return textView
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Answer", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    var keyboardHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        addSubview(textView)
        addSubview(continueButton)
    }
    
    override func layoutSubviews() {
        continueButton.frame = CGRect(x: 20, y: frame.height - (keyboardHeight == 0 ? safeAreaInsets.bottom : 0) - keyboardHeight - 70, width: frame.width - 40, height: 50)
        textView.frame = CGRect(x: 0, y: 0, width: frame.width, height: continueButton.frame.minY)
    }
}
