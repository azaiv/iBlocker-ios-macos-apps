import SwiftUI

struct BaseModalView<Content: View>: View {
    
    @ViewBuilder let content: Content
    
    let action: () -> Void
    
    @Binding var disabled: Bool
    
    var body: some View {
        GeometryReader { frame in
            ScrollView(showsIndicators: false) {
                content
                    .padding()
                    .padding(.bottom, 100)
            }
            Spacer()
            VStack {
                BaseButton(action: {
                    action()
                }, title: Texts.continue_button)
                .disabled(disabled)
            }
        }
    }
}

#Preview {
    BaseModalView(content: {
        TestView()
    }, action: {
        print("tap")
    }, disabled: .constant(false))
}


struct TestView: View {
    
    @State private var closedRange: ClosedRange<Int> = 0...30
    
    var body: some View {
        ForEach(closedRange, id: \.self) { value in
            RoundedRectangle(cornerRadius: 15,
                             style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            .frame(height: 100)
        }
    }
}
