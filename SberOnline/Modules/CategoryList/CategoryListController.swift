import UIKit

final class CategoryListController: UIViewController, ViewSpecificController {
    
    // MARK: - AssociatedType
    
    typealias RootView = CategoryListView
    
    // MARK: - Private Properties
    
    var onSelect: ((Tag?) -> Void)?
    private var contentViewOriginalCenter: CGPoint?
    
    var dataSource: TableViewDataSource? {
        didSet {
            view().tableView.dataSource = dataSource
            view().tableView.reloadData()
        }
    }
    
    var delegate: CategoryTableViewDelegate? {
        didSet {
            view().tableView.delegate = delegate
        }
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = CategoryListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestureRecognizer()
        view().continueButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        dataSource = TableViewDataSource(objects: [Tag.allCases], reuseId: CategoryCell.reuseId)
        delegate = CategoryTableViewDelegate(tags: Tag.allCases)
        delegate?.onTap = onSelect
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.05) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        }
    }
    
    private func setupGestureRecognizer() {
        let closeOnTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeButtonAction))
        closeOnTapGestureRecognizer.delegate = self
        view.addGestureRecognizer(closeOnTapGestureRecognizer)
        
        let dragContentViewGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragContentViewGesture))
        dragContentViewGestureRecognizer.delegate = self
        view().contentView.addGestureRecognizer(dragContentViewGestureRecognizer)
    }
    
    @objc private func dragContentViewGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        if contentViewOriginalCenter == nil {
            contentViewOriginalCenter = view().contentView.center
        }
        
        moveContentView(gestureRecognizer: gestureRecognizer)
        
        contentViewStateEnded(gestureRecognizer: gestureRecognizer)
    }
    
    private func contentViewStateEnded(gestureRecognizer: UIPanGestureRecognizer) {
        
        guard gestureRecognizer.state == .ended, let contentViewOriginalCenter = self.contentViewOriginalCenter else { return }
        
        let distance = contentViewOriginalCenter.y - view().contentView.center.y
        let velocity = gestureRecognizer.velocity(in: view)
        
        if velocity.y > 2_000 {
            view.backgroundColor = .clear
            dismiss(animated: true)
        } else {
            let springVelocity = -1.0 * velocity.y / distance
            
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: springVelocity, options: .curveLinear, animations: {
                self.view().contentView.center = contentViewOriginalCenter
            }, completion: { _ in })
        }
    }
    
    private func moveContentView(gestureRecognizer: UIPanGestureRecognizer) {
        guard gestureRecognizer.state == .began || gestureRecognizer.state == .changed else { return }
        let translation = gestureRecognizer.translation(in: view)
        
        guard let gestureRecognizerView = gestureRecognizer.view else { return }
        
        let newCenter = CGPoint(x: gestureRecognizerView.center.x,
                                y: gestureRecognizerView.center.y + translation.y)
        gestureRecognizerView.center = newCenter
        
        gestureRecognizer.setTranslation(.zero, in: view)
    }
    
    
    @objc private func closeButtonAction() {
        dismiss(animated: true)
    }
}

// MARK: - UIGestureRecognizerDelegate

extension CategoryListController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if gestureRecognizer is UITapGestureRecognizer {
            if let view = touch.view, view == self.view {
                return true
            }
            return false
        }
        return true
    }
}
