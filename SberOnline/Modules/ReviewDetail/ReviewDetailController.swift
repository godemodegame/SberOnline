import UIKit

final class ReviewDetailController: UIViewController, ViewSpecificController {
    
    // MARK: - AssociatedType
    
    typealias RootView = ReviewDetailView
    
    // MARK: - Private Properties
    
    var presenter: ReviewDetailViewOutput?
    
    var dataSource: CollectionDataSource? {
        didSet {
            view().tagsCollectionView.dataSource = dataSource
            view().tagsCollectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = ReviewDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Review"
        presenter?.viewDidLoad()
        view().answerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        presenter?.answerButtonTapped()
    }
}

// MARK: - ReviewDetailViewInput

extension ReviewDetailController: ReviewDetailViewInput {
    func display(review: Review) {
        view().textLabel.text = review.text
        view().teamNameLabel.text = "team: \(review.team)"
        dataSource = CollectionDataSource(objects: [review.tags.map { $0 }], cellReuseId: TagCell.reuseId)
    }
}
