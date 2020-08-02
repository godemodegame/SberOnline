import UIKit
import Nibless

final class ReviewDetailView: NLView {
    let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let teamNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Sber Team"
        return label
    }()
    
    let tagsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 35)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.register([TagCell.self])
        return collectionView
    }()
    
    let answerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Answer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        addSubview(textLabel)
        addSubview(teamNameLabel)
        addSubview(tagsCollectionView)
        addSubview(answerButton)
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            
            teamNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            teamNameLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            teamNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20),
            
            tagsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tagsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tagsCollectionView.heightAnchor.constraint(equalToConstant: 35),
            tagsCollectionView.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 10),
            
            answerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            answerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            answerButton.heightAnchor.constraint(equalToConstant: 50),
            answerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
