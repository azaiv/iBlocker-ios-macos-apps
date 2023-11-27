import Foundation

enum Tabs {
    case home
    case advanced
    case settings
    
    var title: String {
        switch self {
        case .home:
            return Texts.home_title
        case .advanced:
            return Texts.filters_title
        case .settings:
            return Texts.settings_title
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "lock.open.iphone"
        case .advanced:
            return "list.clipboard"
        case .settings:
            return "gear"
        }
    }
}

extension Tabs: Identifiable {
    var id: Self { self }
}
