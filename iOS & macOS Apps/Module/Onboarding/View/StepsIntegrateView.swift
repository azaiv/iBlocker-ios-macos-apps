import SwiftUI

struct StepsIntegrateView: View {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @State private var range: ClosedRange<Int> = 1...5
    
    var body: some View {
        BaseModalView(content: {
            BaseText(text: Texts.steps_view_title,
                     font: .title)
            .padding(.bottom, 10)
            setupView()
        })
    }
    
    @ViewBuilder
    private func setupView() -> some View {
        VStack(alignment: .leading) {
            ForEach(range, id: \.self) { value in
                BaseText(text: "Step \(value) of 5.",
                         fontWeight: .regular)
                RoundedRectangle(cornerRadius: 15,
                                 style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.gray)
                    .frame(height: 100)
                    .padding(.horizontal, 10)
            }
        }
    }
}

#Preview {
    StepsIntegrateView()
        .environmentObject(OnboardingViewModel())
}
