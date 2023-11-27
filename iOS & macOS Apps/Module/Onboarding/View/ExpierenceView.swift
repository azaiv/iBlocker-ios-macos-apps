import SwiftUI

struct ExpierenceView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    @State private var selection: ChooseBlockType.ID? = nil
    @State private var isActive: Bool = false

    var body: some View {
        GeometryReader { frame in
            BaseModalView(content: {
                setupView()
                    .padding(.vertical)
                    .frame(height: frame.size.height)
            })
            .onChange(of: onboardingViewModel.chooseBlockType) { _, _ in
                onboardingViewModel.disabledButton = false
            }
        }
        .scrollDisabled(true)
    }
    
    @ViewBuilder
    private func setupView() -> some View {
        VStack(spacing: 15) {
            ForEach(ChooseBlockType.allCases, id: \.id) { type in
                expirienceButton(type)
            }
            Spacer()
            BaseText(text: Texts.experience_first_description,
                     font: .subheadline,
                     fontWeight: .regular,
                     alignment: .center)
            BaseText(text: Texts.experience_second_description,
                     font: .subheadline,
                     fontWeight: .regular,
                     alignment: .center)
            BaseText(text: Texts.experience_third_description,
                     font: .subheadline,
                     fontWeight: .bold,
                     alignment: .center)
            .padding(.bottom, 120)
        }
    }
    
    @ViewBuilder
    private func expirienceButton(_ type: ChooseBlockType) -> some View {
        BaseToggleBlock(title: type.title, 
                        checkbox: true,
                        isActive: Binding(get: {
            onboardingViewModel.chooseBlockType == type
        }, set: { _, _ in
            onboardingViewModel.chooseBlockType = type
        }))
    }
}

#Preview {
    ExpierenceView()
        .environmentObject(OnboardingViewModel())
}
