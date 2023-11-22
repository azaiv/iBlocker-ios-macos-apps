import Foundation

enum FiltersType: CaseIterable {
    
    case general
    case custom
    
    var title: String {
        switch self {
        case .general:
            return Texts.general_rules
        case .custom:
            return Texts.custom_rules
        }
    }
}

enum GeneralRules: CaseIterable {
    case adversting
    case adult
    case popUps
    case comments
    case trackers
    case widgets
    case custom
    
    var title: String {
        switch self {
        case .adversting:
            return Texts.block_ads
        case .adult:
            return Texts.block_adult_sites
        case .popUps:
            return Texts.block_annoyances
        case .comments:
            return Texts.block_comments
        case .trackers:
            return Texts.block_trackers
        case .widgets:
            return Texts.block_widgets
        case .custom:
            return "Custom Rules"
        }
    }
    
    var key: String {
        switch self {
        case .adversting:
            return "adversting"
        case .adult:
            return "adult"
        case .popUps:
            return "popUps"
        case .comments:
            return "comments"
        case .trackers:
            return "trackers"
        case .widgets:
            return "widgets"
        case .custom:
            return ""
        }
    }
    
    var bundle: String {
        switch self {
        case .adversting:
            return "com.iblocker.ios-macos-apps.blockAdsExtension"
        case .adult:
            return "com.iblocker.ios-macos-apps.blockAdultExtension"
        case .popUps:
            return "com.iblocker.ios-macos-apps.blockPop-UpsExtension"
        case .comments:
            return "com.iblocker.ios-macos-apps.blockCommentsExtension"
        case .trackers:
            return "com.iblocker.ios-macos-apps.blockTrackersExtension"
        case .widgets:
            return "com.iblocker.ios-macos-apps.blockWidgetsExtension"
        case .custom:
            return "com.iblocker.ios-macos-apps.customRulesExtension"
        }
    }
}

extension GeneralRules: Identifiable {
    var id: Self { self }
}

