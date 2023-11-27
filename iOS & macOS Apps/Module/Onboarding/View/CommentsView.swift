import SwiftUI

struct CommentsView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    var body: some View {
        BaseModalView(content: {
            
            BaseText(text: Texts.comments_view_title,
                     font: .largeTitle,
                     fontWeight: .bold)
            .padding(.horizontal)
            .padding(.bottom)
            
            BaseText(text: Texts.comments_view_description,
                     font: .headline,
                     fontWeight: .medium)
            .padding(.bottom)
            
            VStack(spacing: 20) {
                setupView()
                setupView()
                setupView()
                setupView()
                setupView()
            }
        })
    }
    
    @ViewBuilder
    private func setupView() -> some View {
        VStack(spacing: 10) {
            HStack {
                VStack {
                    Image(systemName: "quote.opening")
//                    Text(#"""#)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
                        .italic()
                    Spacer()
                }
                HStack {

                    Text("And this is making an instance of a string out of that int value. Press command B to make sure that all builds and that builds okay, so I'm gonna hit option command P to make sure.  \(Image(systemName: "quote.closing"))")
                        .fontDesign(.rounded)
//                    VStack {
//                        Spacer()
//                        Text(#"""#)
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .italic()
//                    }
                }
            }
            .lineSpacing(5)
            .padding()
            HStack(spacing: 5) {
                Spacer()
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
            .fontWeight(.bold)
            .padding(.trailing)
            .padding(.bottom)
            .foregroundColor(.yellow)
        }
        .background {
            RoundedRectangle(cornerRadius: 20.0,
                             style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            .fill(Color.init(uiColor: .systemBackground))
            .stroke(.gray.opacity(0.5))
        }
    }
}

#Preview {
    CommentsView()
}
