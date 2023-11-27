import SwiftUI
import SafariServices

struct AdvancedView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @EnvironmentObject var blockerManager: BlockerManager
    
    @State private var selection: FiltersType = .general
    @State private var addDomenAlert = false
    @State private var webdomain = ""
    
    let userDefaults = UserDefaults(suiteName: "group.iblockertest")
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                BaseText(text: Texts.filter_description,
                         font: .subheadline,
                         fontWeight: .medium,
                         alignment: .leading)
                .foregroundColor(.secondary)
                .padding(.horizontal, 20)
                BaseButton(action: {
                    addDomenAlert = true
                }, title: "Add Domain",
                           blur: false,
                           color: .accentColor)
                .padding(.vertical)
                customRules(blockerManager.parseJSONFile())
            }
            .navigationTitle("Advanced Filters")
            .alert(Texts.alert_domain_block_title,
                   isPresented: $addDomenAlert) {
                TextField("", text: $webdomain)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
                
                Button(role: .destructive,
                       action: {
                    blockerManager.updateJSONString(webdomain)
                    webdomain = ""
                    SFContentBlockerManager.reloadContentBlocker(withIdentifier: GeneralRules.custom.bundle,
                                                                 completionHandler: { error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                    })
                }, label: {
                    BaseText(text: Texts.continue_button)
                })
                
                Button(role: .cancel,
                       action: {
                    addDomenAlert = false
                }, label: {
                    BaseText(text: Texts.cancel)
                })
                
            } message: {
                BaseText(text: Texts.alert_domain_block_description,
                         font: .headline,
                         fontWeight: .regular)
            }
        }
    }
    
    @ViewBuilder
    private func customRules(_ websites: [String]?) -> some View {
        if websites != nil {
            ForEach(websites!, id: \.self) { website in
                VStack(spacing: 10) {
                    Toggle(isOn: .constant(false), label: {
                        BaseText(text: website)
                    })
                    Divider()
                }
                .padding(.horizontal, 30)
            }
        } else {
            ContentUnavailableView("Title", systemImage: "network.badge.shield.half.filled")
        }
    }
}

#Preview {
    AdvancedView()
        .environmentObject(OnboardingViewModel())
        .environmentObject(BlockerManager())
}
