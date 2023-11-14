import SwiftUI

struct OnboardingChooseButton: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    let image: String
    let text: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.4), {
                for type in ChooseBlockType.allCases {
                    if type.title == text {
                        onboardingViewModel.chooseBlockType = type
                    }
                }
            })
        }, label: {
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: image)
                    .foregroundColor(.orange)
                CustomText(text: text,
                           font: .subheadline,
                           alignment: .leading)
                .foregroundColor(onboardingViewModel.chooseBlockType?.title == text ? .white : .black)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, 
                   alignment: .leading)
            .padding()
            .contentShape(Rectangle())
        })
        .buttonStyle(.plain)
        .background(onboardingViewModel.chooseBlockType?.title == text ? .blue : .gray)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}

#Preview {
    OnboardingChooseButton(image: "hand.thumbsup.fill", text: "Test")
        .environmentObject(OnboardingViewModel())
}
