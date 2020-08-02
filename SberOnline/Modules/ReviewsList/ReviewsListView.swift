import UIKit
import Nibless

final class ReviewsListView: NLView {
    
    let refreshControl = UIRefreshControl()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.register([ReviewCell.self])
        tableView.tableFooterView = UIView()
        tableView.refreshControl = refreshControl
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        addSubview(tableView)
    }
    
    override func layoutSubviews() {
        tableView.frame = bounds
    }
}
