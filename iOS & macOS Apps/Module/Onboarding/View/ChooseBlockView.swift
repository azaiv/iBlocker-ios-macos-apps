import SwiftUI

enum SelectionType: CaseIterable {
    case toggle
    case expirience
}

struct ChooseBlockView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    @State private var progress = 0.5
    @State private var total = 1.0
    @State private var selection: SelectionType = .toggle
    
    var body: some View {
        NavigationView {
            VStack {
                ProgressView(value: progress,
                             total: total)
                .padding(.horizontal, 30)
                .padding(.top, 10)
                CustomText(text: progress == 0.5 ? Texts.choose_block_title_first : Texts.choose_block_title_second,
                           font: .title,
                           fontWeight: .bold,
                           alignment: .center)
                .padding(.vertical, 30)
                TabView(selection: $selection,
                        content:  {
                    ToggleBlockView()
                        .tag(SelectionType.toggle)
                    ExperienceView()
                        .tag(SelectionType.expirience)
                })
                .tabViewStyle(.page)
                Spacer()
                ZStack {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2), {
                            progress = 1.0
                            selection = .expirience
                        })
                    }, label: {
                        CustomText(text: Texts.continue_button,
                                   font: .title2)
                        .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(OnboardingButtonStyle())
                    NavigationLink {
                        CommentsView()
                    } label: {
                        CustomText(text: Texts.continue_button,
                                   font: .title2)
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(OnboardingButtonStyle())
                    .opacity(selection == .expirience ? 1.0 : 0.0)
                }
            }
            .onChange(of: selection) { _, newValue in
                if newValue == SelectionType.expirience {
                    withAnimation(.easeInOut(duration: 0.2), {
                        progress = 1.0
                    })
                } else {
                    withAnimation(.easeInOut(duration: 0.2), {
                        progress = 0.5
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    ChooseBlockView()
        .environmentObject(OnboardingViewModel())
}
