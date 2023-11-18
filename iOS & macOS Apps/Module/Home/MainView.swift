import SwiftUI

struct MainView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    @StateObject var router = Router()
    
    @State private var showOnboarding = false
    @State private var showPurchase = false
    
    var body: some View {
        TabView(selection: .constant(1),
                content:  {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "lock.open.iphone")
                }
            FiltersView()
                .tabItem {
                    Label("Filters", systemImage: "list.clipboard")
                }
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "cellularbars")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        })
        .onChange(of: onboardingViewModel.dismissOnboarding) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showPurchase = true
            }
        }
        .onAppear() {
            showOnboarding = true
        }
        .sheet(isPresented: $showOnboarding) {
            GetStartedView()
                .environmentObject(router)
        }
        .sheet(isPresented: $showPurchase) {
            PurchaseView()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(OnboardingViewModel())
}
