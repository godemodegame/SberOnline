import UIKit

final class CategoryCell: ReusableTableViewCell {
    var isSelectedCell = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        imageView?.image = UIImage(systemName: "circle")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        imageView?.image = selected ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle")
    }
}

extension CategoryCell: Decoratable {
    func decorate(with model: ViewModelProtocol) {
        guard let model = model as? Tag else { fatalError("wrong model for ReviewCell") }
        
        textLabel?.text = model.text
    }
}
