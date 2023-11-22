import SwiftUI

struct FirstSectionView: View {
    
    let type: FirstSection
    
    var body: some View {
        NavigationView {
            switch type {
            case .possibilities:
                possibilitiesView()
            case .howToEnable:
                Color.yellow
            case .faq:
                Color.green
            }
        }
        .navigationTitle(type.title)
    }
    
    @ViewBuilder
    private func possibilitiesView() -> some View {
        List {
            ForEach(PossibilitiesType.allCases, id: \.title) { value in
                Section {
                    NavigationLink(destination: {
                        PossibilitiesView(articleItem: value)
                    }, label: {
                        VStack(alignment: .leading,
                               spacing: 5) {
                            BaseText(text: value.title,
                                     font: .headline)
                            BaseText(text: value.description,
                                     font: .subheadline,
                                     fontWeight: .regular)
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    FirstSectionView(type: .possibilities)
}
