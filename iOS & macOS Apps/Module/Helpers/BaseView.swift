import SwiftUI

struct BaseView: View {
    
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        GeometryReader { frame in
            ScrollView {
                VStack(alignment: .center) {
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
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 70)
                }
                .frame(maxWidth: 414)
                .position(x: frame.size.width * 0.5,
                          y: frame.size.height * 0.4)
            }
        }
    }
}

#Preview {
    BaseView(image: "test", 
             title: Texts.welcome_to_the_app,
             description: Texts.get_started_description)
}
