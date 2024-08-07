import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    @Published var chooseBlockType: ChooseBlockType? = nil

    @Published var selection: ChooseBlockType.ID? = nil
    
    @Published var disabledButton = false
    
    @Published var dismissOnboarding = false
}
