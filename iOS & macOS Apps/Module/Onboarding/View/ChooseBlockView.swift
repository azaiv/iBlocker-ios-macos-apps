import SwiftUI

struct ChooseBlockView: View {
    
    @EnvironmentObject var blockerManager: BlockerManager
    
    let userDefaults = UserDefaults(suiteName: "group.iblockertest")
    
    @State var isActive = false
    
    var body: some View {
        BaseModalView(content: {
            setupView(GeneralRules.allCases)
                
        })
    }
    
    @ViewBuilder
    private func setupView(_ rules: [GeneralRules]) -> some View {
//        GeometryReader { frame in
        VStack {
            BaseText(text: Texts.choose_block_title_first,
                     font: .title,
                     fontWeight: .bold,
                     alignment: .center)
                VStack(spacing: 15) {
                    BaseToggleBlock(title: GeneralRules.adversting.title,
                                    checkbox: false,
                                    isActive: Binding(
                                        get: {
                                            blockerManager.blockAdversting
                                        }, set: { isBlocking in
                                            userDefaults!.set(isBlocking, forKey: GeneralRules.adult.key)
                                            userDefaults!.synchronize()
                                            blockerManager.blockAdversting = isBlocking
                                        }))
                    
                    BaseToggleBlock(title: GeneralRules.adult.title,
                                    checkbox: false,
                                    isActive: Binding(
                                        get: {
                                            blockerManager.blockAdult
                                        }, set: { isBlocking in
                                            userDefaults!.set(isBlocking, forKey: GeneralRules.adult.key)
                                            userDefaults!.synchronize()
                                            blockerManager.blockAdult = isBlocking
                                        }))
                    
                    BaseToggleBlock(title: GeneralRules.popUps.title,
                                    checkbox: false,
                                    isActive: Binding(
                                        get: {
                                            blockerManager.blockPopUps
                                        }, set: { isBlocking in
                                            userDefaults!.set(isBlocking, forKey: GeneralRules.popUps.key)
                                            userDefaults!.synchronize()
                                            blockerManager.blockPopUps = isBlocking
                                        }))
                    
                    BaseToggleBlock(title: GeneralRules.comments.title,
                                    checkbox: false,
                                    isActive: Binding(
                                        get: {
                                            blockerManager.blockComments
                                        }, set: { isBlocking in
                                            userDefaults!.set(isBlocking, forKey: GeneralRules.comments.key)
                                            userDefaults!.synchronize()
                                            blockerManager.blockComments = isBlocking
                                        }))
                    
                    BaseToggleBlock(title: GeneralRules.trackers.title,
                                    checkbox: false,
                                    isActive: Binding(
                                        get: {
                                            blockerManager.blockTrackers
                                        }, set: { isBlocking in
                                            userDefaults!.set(isBlocking, forKey: GeneralRules.trackers.key)
                                            userDefaults!.synchronize()
                                            blockerManager.blockTrackers = isBlocking
                                        }))
                    
                    BaseToggleBlock(title: GeneralRules.widgets.title,
                                    checkbox: false,
                                    isActive: Binding(
                                        get: {
                                            blockerManager.blockWidgets
                                        }, set: { isBlocking in
                                            userDefaults!.set(isBlocking, forKey: GeneralRules.widgets.key)
                                            userDefaults!.synchronize()
                                            blockerManager.blockWidgets = isBlocking
                                        }))
                    
                    BaseToggleBlock(title: GeneralRules.custom.title,
                                    checkbox: false,
                                    isActive: Binding(
                                        get: {
                                            blockerManager.customRules
                                        }, set: { isBlocking in
                                            userDefaults!.set(isBlocking, forKey: GeneralRules.custom.key)
                                            userDefaults!.synchronize()
                                            blockerManager.customRules = isBlocking
                                        }))
                    
                }
//                .padding()
                Spacer()
            }
//        }
    }
}

#Preview {
    ChooseBlockView()
        .environmentObject(BlockerManager())
}
