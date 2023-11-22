import Foundation

enum FirstSection: CaseIterable {
    case possibilities
    case howToEnable
    case faq
    
    var title: String {
        switch self {
        case .possibilities:
            return "What can iBlocker"
        case .howToEnable:
            return "How to enable"
        case .faq:
            return "FAQ"
        }
    }
    
    var image: String {
        switch self {
        case .possibilities:
            return "shield"
        case .howToEnable:
            return "questionmark.circle"
        case .faq:
            return "info.circle"
        }
    }
}


enum SecondSection: CaseIterable {
    case faceid
    case premium
    case rateUS
    case report
    
    var title: String {
        switch self {
        case .faceid:
            return "Face ID"
        case .premium:
            return "Premium"
        case .rateUS:
            return "Rate US"
        case .report:
            return "Report an issue"
        }
    }
    
    var image: String {
        switch self {
        case .faceid:
            return "faceid"
        case .premium:
            return "cart"
        case .rateUS:
            return "hand.thumbsup.circle"
        case .report:
            return "exclamationmark.bubble"
        }
    }
}
