import SwiftUI

struct BaseModalView<Content: View>: View {
    
    @ViewBuilder let content: Content

    var body: some View {
        GeometryReader { frame in
            ScrollView(showsIndicators: false) {
                content
                    .padding()
                    .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    BaseModalView(content: {
        TestView()
    })
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
