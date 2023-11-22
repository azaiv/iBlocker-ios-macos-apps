import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Text("Home")
                .navigationTitle(Texts.home_title)
        }
    }
}

#Preview {
    HomeView()
}
