import SwiftUI

struct FirstSectionView: View {
    
    @Environment(\.locale) var locale
    
    let type: FirstSection
    @State var articles: Test?
    
    var body: some View {
        NavigationView {
            switch type {
            case .possibilities:
                if articles != nil {
                    possibilitiesView(articles!)
                } else {
                    ContentUnavailableView("Not Found", 
                                           systemImage: "xmark.diamond")
                }
            case .howToEnable:
                Color.yellow
            case .faq:
                Color.green
            }
        }
        .onAppear() {
            print(locale.identifier.components(separatedBy: "_").first!)
            articles = parse()
        }
        .navigationTitle(type.title)
    }
    
    @ViewBuilder
    private func possibilitiesView(_ articles: Test) -> some View {
        List {
//            ForEach(articles, id: \.id) { value in
                Section {
                    NavigationLink(destination: {
                        PossibilitiesView(test: articles)
                    }, label: {
                        VStack(alignment: .leading,
                               spacing: 5) {
                            BaseText(text: articles.title,
                                     font: .headline)
                            BaseText(text: "",
                                     font: .subheadline,
                                     fontWeight: .regular)
                        }
                    })
//                }
            }
        }
    }
    
    func parse() -> Test {
        let jsonFile = Bundle.main.url(forResource: "article", withExtension: "json")
        let locale = locale.identifier.components(separatedBy: "_").first!
        do {
            if let jsonData = try? Data(contentsOf: jsonFile!),
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
                let articlesArray = jsonObject["artcile"] as? [[String: Any]] {
                var articles = Test(title: "Empty", texts: [], image: [])
                for articleData in articlesArray {
                    if let titleData = articleData["title"] as? [String: String] {
                        articles.title = titleData[locale]!
                    } else if let textData = articleData["text"] as? [String: String] {
                        articles.texts.append(textData[locale]!)
                    } else if let imageData = articleData["image"] as? [String: String] {
                        articles.image.append(imageData[locale]!)
                    }
                }
                return articles
            }
            
        } catch {
            print("Error")
            
        }
        return .init(title: "Empty", texts: [], image: [])
    }
}

#Preview {
    FirstSectionView(type: .possibilities,
                     articles: .init(title: "Test",
                                      texts: [],
                                      image: []))
}
