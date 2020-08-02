import UIKit
import Nibless

typealias ReusableTableViewCell = Reusable & NLTableViewCell

extension UITableView {
    func register(_ array: [ReusableTableViewCell.Type]) {
        array.forEach { (type) in
            register(type.self, forCellReuseIdentifier: type.reuseId)
        }
    }
}
