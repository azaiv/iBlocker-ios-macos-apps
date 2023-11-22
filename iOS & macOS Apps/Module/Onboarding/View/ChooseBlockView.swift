import SwiftUI

struct ChooseBlockView: View {
    
    @EnvironmentObject var blockerManager: BlockerManager
    
    let userDefaults = UserDefaults(suiteName: "group.iblockertest")
    
    var body: some View {
        BaseModalView(content: {
            setupView()
        })
    }
    
    @ViewBuilder
    private func setupView() -> some View {
        VStack {
            BaseText(text: Texts.choose_block_title_first,
                     font: .title,
                     fontWeight: .bold,
                     alignment: .center)
            VStack {
                ForEach(GeneralRules.allCases) { rules in
                    Toggle(isOn: Binding(
                        get: {
                            userDefaults!.bool(forKey: rules.key)
                        }, set: { isBlocking in
                            userDefaults!.set(isBlocking, forKey: rules.key)
                            userDefaults!.synchronize()
                        }), label: {
                            Label(rules.title, systemImage: "square.fill")
                        })
                }
            }
            .padding(.horizontal, 50)
            Spacer()
        }
    }
}

#Preview {
    ChooseBlockView()
        .environmentObject(BlockerManager())
}
