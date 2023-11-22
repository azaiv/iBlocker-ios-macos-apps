import SwiftUI

struct PossibilitiesView: View {
    
    let articleItem: PossibilitiesType
    
    var body: some View {
            BaseModalView(content: {
                ForEach(articleItem.article, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.text)
                        RoundedRectangle(cornerRadius: 25, 
                                         style: .continuous)
                            .fill(.secondary)
                            .frame(height: 100)
                        //                    Image(item.image)
                    }
                }
            })
            .navigationTitle(articleItem.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PossibilitiesView(articleItem: .hideElement)
}
