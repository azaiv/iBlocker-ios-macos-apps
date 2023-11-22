import SwiftUI
import LocalAuthentication

struct FaceIDView: View {
    
    @EnvironmentObject var authenticate: Authenticate
    
    var body: some View {
        List {
            Toggle(isOn: $authenticate.authenticateEnabled,
                   label: {
                Label(SecondSection.faceid.title,
                      systemImage: SecondSection.faceid.image)
            })
            .onChange(of: authenticate.authenticateEnabled) { _, newValue in
                if newValue {
                    authenticate.authenticate()
                }
            }
        }
        .navigationTitle(SecondSection.faceid.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FaceIDView()
}
