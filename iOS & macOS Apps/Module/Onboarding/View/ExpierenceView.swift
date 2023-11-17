import SwiftUI

struct ExpierenceView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    @State private var selection: ChooseBlockType.ID? = nil
    @State private var isPresented = false
    @State private var isDisabled = true
    
    var body: some View {
        GeometryReader { frame in
            BaseModalView(content: {
                setupView()
                    .padding(.vertical)
                    .frame(height: frame.size.height)
            }, action: {
                isPresented = true
            }, disabled: $isDisabled)
            .onChange(of: onboardingViewModel.chooseBlockType) { _, _ in
                isDisabled = false
            }
            
        }
        .scrollDisabled(true)
        .navigationDestination(isPresented: $isPresented) {
            CommentsView()
        }
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
            .padding(.bottom, 100)
        }
    }
    
    @ViewBuilder
    private func expirienceButton(_ type: ChooseBlockType) -> some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.4), {
                onboardingViewModel.chooseBlockType = type
            })
        }, label: {
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
        })
        .buttonStyle(.plain)
        .background(onboardingViewModel.chooseBlockType?.title == type.title ? .blue : .gray)
        .clipShape(RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
    }
}

#Preview {
    ExpierenceView()
        .environmentObject(OnboardingViewModel())
}
