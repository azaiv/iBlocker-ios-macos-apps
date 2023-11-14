import SwiftUI

@main
struct iBlockerApp: App {
    
    @State var onboardingViewModel = OnboardingViewModel()
    
    var body: some Scene {
        WindowGroup {
            GetStartedView()
                .environmentObject(onboardingViewModel)
                .tint(.blue)
        }
    }
}
