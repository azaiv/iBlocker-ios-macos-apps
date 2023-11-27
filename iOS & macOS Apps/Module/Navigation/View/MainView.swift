import SwiftUI
import LocalAuthentication

struct MainView: View {

    @Environment(\.scenePhase) var scenePhase
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @EnvironmentObject var authenticate: Authenticate
    
    @StateObject var router = Router()
    
    @Binding var isOnboarding: Bool
    
    @State private var selection: Tabs = .home
    @State private var showPurchase = false
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tag(Tabs.home)
                .tabItem {
                    Label(Tabs.home.title, systemImage: Tabs.home.image)
                }
            AdvancedView()
                .tag(Tabs.advanced)
                .tabItem {
                    Label(Tabs.advanced.title, systemImage: Tabs.advanced.image)
                }
            SettingsView()
                .tag(Tabs.settings)
                .tabItem {
                    Label(Tabs.settings.title, systemImage: Tabs.settings.image)
                }
        }
        .overlay {
            if scenePhase == .inactive && authenticate.authenticateEnabled {
                Color.clear
                    .ignoresSafeArea()
                    .background(.ultraThinMaterial)
                    .mask(alignment: .top) {
                        LinearGradient(colors: [.black, .black, .black, .black, .black],
                                       startPoint: .top,
                                       endPoint: .bottom)
                        .frame(maxWidth: .infinity)
                    }
            }
        }
        .onChange(of: onboardingViewModel.dismissOnboarding) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showPurchase = true
                isOnboarding = false
            }
        }
        .onAppear() {
            if authenticate.authenticateEnabled {
                authenticate.authenticate()
            }
        }
        .sheet(isPresented: $isOnboarding) {
            GetStartedView()
                .environmentObject(router)
        }
        .sheet(isPresented: $showPurchase) {
            PurchaseView()
        }
    }
}

#Preview {
    MainView(isOnboarding: .constant(false))
        .environmentObject(OnboardingViewModel())
        .environmentObject(Authenticate())
}
