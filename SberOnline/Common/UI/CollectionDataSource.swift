import UIKit.UICollectionView

final class CollectionDataSource: NSObject, UICollectionViewDataSource {
    
    let objects: [[ViewModelProtocol]]
    let cellReuseId: String
    
    init(objects: [[ViewModelProtocol]], cellReuseId: String) {
        self.objects = objects
        self.cellReuseId = cellReuseId
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath)
        (cell as? Decoratable)?.decorate(with: objects[indexPath.section][indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { objects.count }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { objects[section].count }
}
