import UIKit.UITableView

final class TableViewDataSource: NSObject, UITableViewDataSource {
    
    let objects: [[ViewModelProtocol]]
    let reuseId: String
    
    init(objects: [[ViewModelProtocol]], reuseId: String) {
        self.objects = objects
        self.reuseId = reuseId
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
        (cell as? Decoratable)?.decorate(with: objects[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { objects[section].count }
    func numberOfSections(in tableView: UITableView) -> Int { objects.count }
}
