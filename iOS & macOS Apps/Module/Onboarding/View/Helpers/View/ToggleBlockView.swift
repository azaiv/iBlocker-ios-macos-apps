import SwiftUI

struct ToggleBlockView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Toggle(isOn: $onboardingViewModel.youtubeAds, label: {
                Label(
                    title: { CustomText(text: Texts.youtube_ads) },
                    icon: { Image(systemName: "square.fill") }
                )
            })
            
            Toggle(isOn: $onboardingViewModel.popUpAds, label: {
                Label(
                    title: { CustomText(text: Texts.pop_up_ads) },
                    icon: { Image(systemName: "square.fill") }
                )
            })
            
            Toggle(isOn: $onboardingViewModel.appAndWebTrackers, label: {
                Label(
                    title: { CustomText(text: Texts.app_and_web_trackers) },
                    icon: { Image(systemName: "square.fill") }
                )
            })
            
            Toggle(isOn: $onboardingViewModel.cookieRequests, label: {
                Label(
                    title: { CustomText(text: Texts.coockie_requests) },
                    icon: { Image(systemName: "square.fill") }
                )
            })
            
            Toggle(isOn: $onboardingViewModel.adultContent, label: {
                Label(
                    title: { CustomText(text: Texts.adult_content) },
                    icon: { Image(systemName: "square.fill") }
                )
            })
            Spacer()
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    ToggleBlockView()
        .environmentObject(OnboardingViewModel())
}
