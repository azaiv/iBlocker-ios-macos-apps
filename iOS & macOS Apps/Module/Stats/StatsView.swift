import SwiftUI

struct StatsView: View {
    var body: some View {
        NavigationStack {
            Text("Stats")
                .navigationTitle(Texts.stats_title)
        }
    }
}

#Preview {
    StatsView()
}
