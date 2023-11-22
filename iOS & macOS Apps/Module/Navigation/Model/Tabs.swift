import Foundation

enum Tabs {
    case home
    case filters
    case stats
    case settings
    
    var title: String {
        switch self {
        case .home:
            return Texts.home_title
        case .filters:
            return Texts.filters_title
        case .stats:
            return Texts.stats_title
        case .settings:
            return Texts.settings_title
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "lock.open.iphone"
        case .filters:
            return "list.clipboard"
        case .stats:
            return "cellularbars"
        case .settings:
            return "gear"
        }
    }
}

extension Tabs: Identifiable {
    var id: Self { self }
}
