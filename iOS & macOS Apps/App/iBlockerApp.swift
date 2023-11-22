import SwiftUI

@main
struct iBlockerApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    @StateObject private var onbordingViewModel = OnboardingViewModel()
    @StateObject private var blockerManager = BlockerManager()
    @StateObject private var authenticate = Authenticate()

    var body: some Scene {
        WindowGroup {
            MainView(isOnboarding: $isOnboarding)
                .environmentObject(authenticate)
                .environmentObject(onbordingViewModel)
                .environmentObject(blockerManager)
        }
    }
}
