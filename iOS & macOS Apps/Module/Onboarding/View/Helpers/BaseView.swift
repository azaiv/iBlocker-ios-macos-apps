import SwiftUI

struct BaseView: View {
    
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        GeometryReader { frame in
            ScrollView {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: frame.size.height / 2)
                    .padding(70)
                BaseText(text: title,
                         font: .largeTitle,
                         fontWeight: .bold,
                         alignment: .center)
                BaseText(text: description,
                         font: .headline)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .padding()
                .padding()
                .background(.clear)
            }
        }
    }
}

#Preview {
    BaseView(image: "test", 
             title: Texts.welcome_to_the_app,
             description: Texts.get_started_description)
}
