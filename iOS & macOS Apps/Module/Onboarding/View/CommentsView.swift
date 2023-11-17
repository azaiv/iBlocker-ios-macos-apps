import SwiftUI

struct CommentsView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    @State private var isPresented = false
    
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
            
            setupView()
            setupView()
            setupView()
            setupView()
            setupView()
            setupView()
        }, action: {
            isPresented = true
        }, disabled: .constant(false))
        .navigationDestination(isPresented: $isPresented) {
            StepsIntegrateView()
        }
    }
    
    @ViewBuilder
    private func setupView() -> some View {
        VStack(spacing: 10) {
            HStack(spacing: 5) {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
            .foregroundColor(.yellow)
            Text("Great app! I give 4 stars so that you don’t get discouraged and make the application only better!")
                .italic()
                .lineLimit(5)
            HStack {
                Spacer()
                Text("azaiv")
                    .frame(alignment: .trailing)
                    .italic()
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    CommentsView()
}
