import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 5) {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
            .foregroundColor(.yellow)
            Text("Prilojenie realno zaebis, stavlyu 4 zvezda, postavlu 5 posle togo kak podnimite zarplatu rasrabotchiku.")
                .italic()
                .lineLimit(5)
            HStack {
                Spacer()
                Text("azaiv")
                    .frame(alignment: .trailing)
                    .italic()
                    .foregroundColor(.gray)
            }

        }
    }
}

#Preview {
    CommentView()
}
