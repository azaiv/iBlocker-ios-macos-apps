import SwiftUI

struct MainView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @State private var isOnboarding2 = false
    @State private var showPurchase = false
    
    var body: some View {
        NavigationStack {
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
            .onAppear() {
                isOnboarding2 = true
            }
            .sheet(isPresented: $isOnboarding2, content: {
                GetStartedView()
            })
            .onChange(of: onboardingViewModel.dismissOnboarding) { _, _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
                    showPurchase = true
                }
            }
            .sheet(isPresented: $showPurchase, content: {
                PurchaseView()
                    .interactiveDismissDisabled()
            })
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainView()
}
