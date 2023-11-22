import SwiftUI

struct NotificationView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    var body: some View {
        BaseModalView(content: {
            setupView()
        })
    }
    
    @ViewBuilder
    private func setupView() -> some View {
        VStack {
            BaseText(text: Texts.notifications_view_title,
                     font: .title,
                     alignment: .center)
            .padding(.bottom, 20)
            BaseText(text: Texts.notifications_view_description,
                     font: .subheadline,
                     fontWeight: .regular)
        }
    }
}

#Preview {
    NotificationView()
}
