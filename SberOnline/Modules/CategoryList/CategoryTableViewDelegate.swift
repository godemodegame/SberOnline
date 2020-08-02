import UIKit.UITableView

final class CategoryTableViewDelegate: NSObject, UITableViewDelegate {
    
    var tags: [Tag]
    var onTap: ((Tag?) -> Void)?
    
    init(tags: [Tag]) {
        self.tags = tags
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? CategoryCell
        cell?.isSelectedCell.toggle()
        if cell?.isSelectedCell == false {
            tableView.deselectRow(at: indexPath, animated: true)
            onTap?(nil)
        } else {
            onTap?(tags[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
}
