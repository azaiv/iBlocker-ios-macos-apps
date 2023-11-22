import SwiftUI

struct ExpierenceView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    @State private var selection: ChooseBlockType.ID? = nil

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
        VStack {
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
        
        RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            .fill(onboardingViewModel.chooseBlockType?.title == type.title ? .blue : .gray)
            .frame(height: 50)
            .overlay {
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: type.image)
                        .foregroundColor(.orange)
                    BaseText(text: type.title,
                             font: .subheadline,
                             alignment: .leading)
                    .foregroundColor(onboardingViewModel.chooseBlockType?.title == type.title ? .white : .black)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                       alignment: .leading)
                .padding()
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.4), {
                        onboardingViewModel.chooseBlockType = type
                    })
                }
            }
    }
}

#Preview {
    ExpierenceView()
        .environmentObject(OnboardingViewModel())
}
