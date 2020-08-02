import UIKit.UITableView

final class ReviewsTableViewDelegate: NSObject, UITableViewDelegate {
    
    let reviews: [Review]
    var onTap: ((Review) -> Void)?
    
    init(reviews: [Review]) {
        self.reviews = reviews
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        onTap?(reviews[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 120 }
}
