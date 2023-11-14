import SwiftUI

struct GetStartedView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                CustomText(text: Texts.welcome_to_the_app,
                           font: .largeTitle,
                           fontWeight: .bold,
                           alignment: .center)
                CustomText(text: Texts.get_started_description,
                           font: .headline)
                .padding(.top, 15)
                Spacer()
                NavigationLink {
                    ChooseBlockView()
                } label: {
                    CustomText(text: Texts.get_started_title_button,
                               font: .title2)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(OnboardingButtonStyle())
            }
            .multilineTextAlignment(.center)
            .frame(alignment: .center)
            .padding()
        }
    }
}

#Preview {
    GetStartedView()
}
