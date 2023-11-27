import SwiftUI

struct PossibilitiesView: View {
    
    let test: Test
    
    var body: some View {
            BaseModalView(content: {
                ForEach(0...test.image.count - 1, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(test.texts[index])
                        if test.image[index] != nil {
                            AsyncImage(
                                url: URL(string: test.image[index]!),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 300, maxHeight: 100)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                        }
                    }
                }
            })
            .navigationTitle(test.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PossibilitiesView(test: .init(title: "Title", texts: ["Text 1", "Text 2"], image: []))
}
