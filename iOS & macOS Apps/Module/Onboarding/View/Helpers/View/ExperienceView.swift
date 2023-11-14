import SwiftUI

struct ExperienceView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    @State private var progress = 0.5
    @State private var total = 1.0
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(ChooseBlockType.allCases) { type in
                OnboardingChooseButton(image: type.image, text: type.title)
            }
            Spacer()
            CustomText(text: Texts.experience_first_description,
                       font: .subheadline,
                       fontWeight: .regular,
                       alignment: .center)
            CustomText(text: Texts.experience_second_description,
                       font: .subheadline,
                       fontWeight: .regular,
                       alignment: .center)
            CustomText(text: Texts.experience_third_description,
                       font: .subheadline,
                       fontWeight: .bold,
                       alignment: .center)
            .padding(.bottom, 15)
        }
        .padding()
    }
}

#Preview {
    ExperienceView()
        .environmentObject(OnboardingViewModel())
}
