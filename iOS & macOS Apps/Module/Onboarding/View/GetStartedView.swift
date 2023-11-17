import SwiftUI

struct GetStartedView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    @State private var showModal = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                BaseView(image: "test",
                         title: Texts.welcome_to_the_app,
                         description: Texts.get_started_description)
                BaseButton(action: {
                    showModal = true
                }, title: Texts.continue_button)
            }
            .navigationDestination(isPresented: $showModal) {
                ChooseBlockView()
            }
            .onChange(of: onboardingViewModel.dismissOnboarding) { _, _ in
                dismiss()
            }
        }
    }
}

#Preview {
    GetStartedView()
}
