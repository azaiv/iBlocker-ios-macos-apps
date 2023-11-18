import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    @Published var chooseBlockType: ChooseBlockType? = nil
    
    @Published var youtubeAds = false
    @Published var popUpAds = false
    @Published var appAndWebTrackers = false
    @Published var cookieRequests = false
    @Published var adultContent = false
    
    @Published var selection: ChooseBlockType.ID? = nil
    
    @Published var disabledButton = false
    
    @Published var dismissOnboarding = false
}
