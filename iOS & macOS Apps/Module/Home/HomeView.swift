import SwiftUI
import SafariServices

struct HomeView: View {
    
    let userDefaults = UserDefaults(suiteName: "group.iblockertest")
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                generalRules()
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 414)
                    .navigationTitle("iBlocker Filters")
                    .safeAreaInset(edge: .top, content: {
                        VStack {
                            Image(systemName: "xmark.shield.fill")
                                .font(.largeTitle)
                                .padding(.bottom, 10)
                            BaseText(text: "You're not protected")
                                
                            BaseButton(action: {
                                
                            }, title: "Enable iBlocker filters",
                                       image: "play.fill",
                                       blur: false,
                                       color: .green)
                            BaseText(text: "Click enable or disable to activate more then 100.000 rules", 
                                     font: .caption,
                                     fontWeight: .regular)
                                .foregroundStyle(.secondary)
                                .padding(10)
                        }
                    })
                
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
}

#Preview {
    HomeView()
}
