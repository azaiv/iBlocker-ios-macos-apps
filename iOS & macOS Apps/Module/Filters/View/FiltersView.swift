import SwiftUI
import SafariServices

struct FiltersView: View {
    
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
                         fontWeight: .medium)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                .safeAreaInset(edge: .top) {
                    Picker("", selection: $selection) {
                        BaseText(text: FiltersType.general.title)
                            .tag(FiltersType.general)
                        BaseText(text: FiltersType.custom.title)
                            .tag(FiltersType.custom)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                if selection == .custom {
                    Button(action: {
                        addDomenAlert = true
                    }, label: {
                        BaseText(text: "Add Domain",
                                 font: .title3,
                                 fontWeight: .semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                    })
                    .buttonStyle(BaseButtonStyle())
                    .padding()
                    
                }
                if selection == .general {
                    generalRules()
                        .padding(.top, 10)
                        .padding(.horizontal, 30)
                } else {
                    customRules(blockerManager.parseJSONFile())
                }
            }
            .navigationTitle(Texts.filter_navigation_title)
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
    private func generalRules() -> some View {
        ForEach(GeneralRules.allCases) { rules in
            generalRow(image: "app",
                       title: rules.title,
                       countBlocks: 9999,
                       description: "This set of rules will allow you to block all known types of banner ads",
                       isBlocked: Binding(
                        get: {
                            userDefaults!.bool(forKey: rules.key)
                        }, set: { isBlocking in
                            userDefaults!.set(isBlocking, forKey: rules.key)
                            userDefaults!.synchronize()
                            SFContentBlockerManager.reloadContentBlocker(withIdentifier: rules.bundle,
                                                                         completionHandler: { error in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        }))
        }
    }
    
    @ViewBuilder
    private func generalRow(image: String,
                            title: String,
                            countBlocks: Int,
                            description: String,
                            isBlocked: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Toggle(isOn: isBlocked, label: {
                VStack {
                    HStack {
                        Image(systemName: image)
                        VStack(alignment: .leading) {
                            BaseText(text: title, font: .headline)
                            BaseText(text: "\(countBlocks) rules",
                                     font: .subheadline,
                                     fontWeight: .regular)
                        }
                    }
                    
                }
            })
            BaseText(text: description,
                     font: .subheadline,
                     fontWeight: .regular,
                     alignment: .leading)
            .foregroundColor(.secondary)
            Divider()
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
    FiltersView()
        .environmentObject(OnboardingViewModel())
        .environmentObject(BlockerManager())
}
