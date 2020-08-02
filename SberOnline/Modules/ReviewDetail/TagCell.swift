import UIKit.UICollectionViewCell

final class TagCell: ReusableCollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "123"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.cornerRadius = 10
        
        addSubview(label)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        label.frame = bounds
    }
}

// MARK: Decoratable

extension TagCell: Decoratable {
    func decorate(with model: ViewModelProtocol) {
        guard let model = model as? Tag else { fatalError("wrong model for TagCell") }
        
        label.text = model.text
        backgroundColor = model.color
    }
}
