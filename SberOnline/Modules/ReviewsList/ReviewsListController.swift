import UIKit

final class ReviewsListController: UIViewController, ViewSpecificController {

    // MARK: - AssociatedType

    typealias RootView = ReviewsListView

    // MARK: - Private Properties

    var presenter: ReviewsListViewOutput?
    
    var dataSource: TableViewDataSource? {
        didSet {
            view().tableView.dataSource = dataSource
            view().tableView.reloadData()
        }
    }
    
    var delegate: ReviewsTableViewDelegate? {
        didSet {
            view().tableView.delegate = delegate
            delegate?.onTap = onTap(review:)
        }
    }
    
    // MARK: - Lifecycle

    override func loadView() {
        view = ReviewsListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupNavigation()
        view().refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.topItem?.title = "Reviews"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(navigationBarButtonTapped(_:)))
    }
    
    @objc private func pullToRefresh() {
        presenter?.pullToRefresh()
    }
    
    @objc private func navigationBarButtonTapped(_ sender: UIBarButtonItem) {
        presenter?.tappedOnSort()
    }
    
    private func onTap(review: Review) {
        presenter?.tapped(on: review)
    }
}

// MARK: - ReviewsListViewInput

extension ReviewsListController: ReviewsListViewInput {
    func display(reviews: [Review]) {
        dataSource = TableViewDataSource(objects: [reviews], reuseId: ReviewCell.reuseId)
        delegate = ReviewsTableViewDelegate(reviews: reviews)
        view().refreshControl.endRefreshing()
    }
}
