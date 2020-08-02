import UIKit
import Nibless

typealias ReusableCollectionViewCell = Reusable & NLCollectionViewCell

extension UICollectionView {
    func register(_ array: [ReusableCollectionViewCell.Type]) {
        array.forEach { (type) in
            register(type.self, forCellWithReuseIdentifier: type.reuseId)
        }
    }
}
