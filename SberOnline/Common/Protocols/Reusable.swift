import UIKit
import Nibless

protocol Reusable: AnyObject {
    static var reuseId: String { get }
}

extension Reusable where Self: NLTableViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}

extension Reusable where Self: NLCollectionViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}
