import SwiftUI

struct GetStartedView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @EnvironmentObject var router: Router
    
    @State private var disabled = false
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            BaseView(image: "test",
                     title: Texts.welcome_to_the_app,
                     description: Texts.get_started_description)
            .navigationDestination(for: Router.Destination.self) { destination in
                switch destination {
                case .getStarted:
                    EmptyView()
                case .chooseBlock:
                    ChooseBlockView()
                case .expierence:
                    ExpierenceView()
                case .comments:
                    CommentsView()
                case .steps:
                    StepsIntegrateView()
                case .notification:
                    NotificationView()
                }
            }
            .interactiveDismissDisabled()
            .onAppear() {
                router.destinationType = .getStarted
            }
        }
        .overlay {
            BaseButton(action: {
                switch router.destinationType {
                case .getStarted:
                    router.navigate(to: .chooseBlock)
                case .chooseBlock:
                    onboardingViewModel.disabledButton = true
                    router.navigate(to: .expierence)
                case .expierence:
                    router.navigate(to: .comments)
                case .comments:
                    router.navigate(to: .steps)
                case .steps:
                    router.navigate(to: .notification)
                case .notification:
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                        Task {
                            onboardingViewModel.dismissOnboarding = true
                            dismiss()
                        }
                    }
                }
            }, title: Texts.continue_button)
            .disabled(onboardingViewModel.disabledButton)
        }
    }
}

#Preview {
    GetStartedView()
        .environmentObject(OnboardingViewModel())
        .environmentObject(Router())
}
