import Foundation

enum ChooseBlockType: CaseIterable, Equatable {
    case never
    case tried
    case already
    
    var title: String {
        switch self {
        case .never:
            return Texts.never_used_before
        case .tried:
            return Texts.tried_but_it_not_works
        case .already:
            return Texts.already_use_an_ad_blocker
        }
    }
    
    var image: String {
        switch self {
        case .never:
            return "hands.clap.fill"
        case .tried:
            return "hand.thumbsdown.fill"
        case .already:
            return "hand.thumbsup.fill"
        }
    }
}

extension ChooseBlockType: Identifiable {
    var id: Self { self }
}
