import Foundation

struct Test {
    let id = UUID()
    var title: String
    var texts: [String]
    var image: [String?]
}

struct ArticleModel {
    let text: Textss?
    let title: Titles?
    let image: Images?
}

struct Textss {
    let en: String?
    let ru: String?
}

struct Titles {
    let en: String?
    let ru: String?
}

struct Images {
    let en: String?
    let ru: String?
}
