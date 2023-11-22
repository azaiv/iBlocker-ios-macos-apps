import Foundation

enum PossibilitiesType: CaseIterable {
    case hideElement
    case creatingCustom
    
    var title: String {
        switch self {
        case .hideElement:
            return "Hide any element on a website"
        case .creatingCustom:
            return "Creating custom block rule"
        }
    }
    
    var description: String {
        switch self {
        case .hideElement:
            return "Learn more about how you can hide any element on a website and not see it more (you can put back it)"
        case .creatingCustom:
            return "Learn more about how you can create a custom block rule"
        }
    }
    
    var article: [ArticleItem] {
        switch self {
        case .hideElement:
            return [.init(text: "Text 1",
                          image: nil),
                    .init(text: "Text 2",
                          image: nil),
                    .init(text: "Text 3",
                          image: nil),
                    .init(text: "Text 4",
                          image: nil),
                    .init(text: "Text 5",
                          image: nil),
            ]
        case .creatingCustom:
            return [.init(text: "Text second 1",
                          image: nil),
                    .init(text: "Text second 2",
                          image: nil),
                    .init(text: "Text second 3",
                          image: nil),
                    .init(text: "Text second 4",
                          image: nil),
                    .init(text: "Text second 5",
                          image: nil),
            ]
        }
    }
}
