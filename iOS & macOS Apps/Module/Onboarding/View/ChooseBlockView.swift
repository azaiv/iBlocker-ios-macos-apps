import SwiftUI

struct ChooseBlockView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
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
                Toggle(isOn: $onboardingViewModel.youtubeAds,
                       label: {
                    Label(
                        title: { BaseText(text: Texts.youtube_ads) },
                        icon: { Image(systemName: "square.fill") }
                    )
                })
                
                Toggle(isOn: $onboardingViewModel.popUpAds,
                       label: {
                    Label(
                        title: { BaseText(text: Texts.pop_up_ads) },
                        icon: { Image(systemName: "square.fill") }
                    )
                })
                
                Toggle(isOn: $onboardingViewModel.appAndWebTrackers,
                       label: {
                    Label(
                        title: { BaseText(text: Texts.app_and_web_trackers) },
                        icon: { Image(systemName: "square.fill") }
                    )
                })
                
                Toggle(isOn: $onboardingViewModel.cookieRequests,
                       label: {
                    Label(
                        title: { BaseText(text: Texts.coockie_requests) },
                        icon: { Image(systemName: "square.fill") }
                    )
                })
                
                Toggle(isOn: $onboardingViewModel.adultContent,
                       label: {
                    Label(
                        title: { BaseText(text: Texts.adult_content) },
                        icon: { Image(systemName: "square.fill") }
                    )
                })
            }
            .padding(.horizontal, 50)
            Spacer()
        }
    }
}

#Preview {
    ChooseBlockView()
        .environmentObject(OnboardingViewModel())
}
