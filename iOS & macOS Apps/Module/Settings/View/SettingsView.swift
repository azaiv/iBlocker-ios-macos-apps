import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.requestReview) var requestReview
    
    @State private var showFaceIDView = false
    @State private var showPurchase = false
    @State private var showRate = false
    @State private var showReport = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(FirstSection.allCases, id: \.hashValue) { value in
                        NavigationLink(destination: {
                            FirstSectionView(type: value, 
                                             articles: nil)
                        }, label: {
                            Label(value.title, systemImage: value.image)
                        })
                    }
                }
                Section {
                    ForEach(SecondSection.allCases, id: \.hashValue) { value in
                        Button(action: {
                            switch value {
                            case .faceid:
                                showFaceIDView = true
                            case .premium:
                                showPurchase = true
                            case .rateUS:
                                requestReview()
                            case .report:
                                let email = "foo@bar.com"
                                if let url = URL(string: "mailto:\(email)") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        }, label: {
                            HStack(spacing: 20) {
                                Image(systemName: value.image)
                                BaseText(text: value.title,
                                         font: .headline,
                                         fontWeight: .regular)
                                .foregroundColor(.primary)
                                if value == .faceid {
                                    Spacer()
                                    Image(systemName: "chevron.forward")
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                        .foregroundStyle(Color.secondary.opacity(0.6))
                                }
                            }
                        })
                    }
                }
            }
            .navigationTitle(Texts.settings_title)
            .navigationDestination(isPresented: $showFaceIDView) {
                FaceIDView()
            }
            .sheet(isPresented: $showPurchase, content: {
                PurchaseView()
            })
        }
    }
}

#Preview {
    SettingsView()
}
