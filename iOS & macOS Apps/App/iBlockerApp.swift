import SwiftUI

@main
struct iBlockerApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = true
    
    @State private var isMenuPresented: Bool = false
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(onboardingViewModel)
        }
    }
}
