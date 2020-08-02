import UIKit

final class ReviewCell: ReusableTableViewCell {
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.numberOfLines = 0
        detailTextLabel?.font = .boldSystemFont(ofSize: 14)
        detailTextLabel?.numberOfLines = 0
        
        backgroundColor = .clear
        addSubview(tagLabel)
        
        [textLabel, detailTextLabel, tagLabel].forEach { $0?.translatesAutoresizingMaskIntoConstraints = false }
        
        [textLabel?.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
         textLabel?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
         textLabel?.topAnchor.constraint(equalTo: topAnchor, constant: 5),
         
         tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
         tagLabel.widthAnchor.constraint(equalToConstant: 80),
         tagLabel.topAnchor.constraint(equalTo: textLabel?.bottomAnchor ?? topAnchor, constant: 7),
         tagLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
         tagLabel.heightAnchor.constraint(equalToConstant: 25),
         
         detailTextLabel?.leadingAnchor.constraint(equalTo: tagLabel.trailingAnchor, constant: 5),
         detailTextLabel?.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
         detailTextLabel?.centerYAnchor.constraint(equalTo: tagLabel.centerYAnchor)
            ].forEach { $0?.isActive = true }
    }
}

extension ReviewCell: Decoratable {
    func decorate(with model: ViewModelProtocol) {
        guard let model = model as? Review else { fatalError("wrong model for ReviewCell") }
        
        textLabel?.text = model.text
        detailTextLabel?.text = "Team: \(model.team)"
        tagLabel.text = model.tags.first?.text
        tagLabel.backgroundColor = model.tags.first?.color ?? .clear
    }
}
