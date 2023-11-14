import SwiftUI

struct CommentsView: View {
    var body: some View {
        VStack(spacing: 20) {
            ScrollView {
                CustomText(text: "Great!",
                           font: .largeTitle,
                           fontWeight: .bold)
                .padding()
                CustomText(text: "We work hard to get you better services. See what people are saying about us. It may say more than our words",
                           font: .title3,
                           fontWeight: .regular)
                .padding(.bottom, 30)
                CommentView()
                CommentView()
                CommentView()
            }
//            Spacer()
            NavigationLink(destination: {
                EmptyView()
            }, label: {
                CustomText(text: Texts.continue_button,
                           font: .title2)
                .frame(maxWidth: .infinity)
            })
            .buttonStyle(OnboardingButtonStyle())
        }
        .padding()
    }
}

#Preview {
    CommentsView()
}
