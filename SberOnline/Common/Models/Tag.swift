import UIKit

enum Tag: ViewModelProtocol, CaseIterable, Identifiable {
    case bug
    case defect
    case wish
    
    var id: UUID { UUID() }
    
    var color: UIColor {
        switch self {
        case .bug: return .systemRed
        case .defect: return .systemOrange
        case .wish: return .systemGreen
        }
    }
    
    var text: String {
        switch self {
        case .bug: return "🐞Bug"
        case .defect: return "Defect"
        case .wish: return "🙏🏻Wish"
        }
    }
}
