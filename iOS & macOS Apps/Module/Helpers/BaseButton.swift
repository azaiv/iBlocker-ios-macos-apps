import SwiftUI

struct BaseButton: View {
    
    let action: () -> Void
    let title: String
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Color.clear
                    .ignoresSafeArea()
                    .background(.ultraThinMaterial)
                    .mask(alignment: .top) {
                        LinearGradient(colors: [.clear, .black, .black, .black, .black],
                                       startPoint: .top,
                                       endPoint: .bottom)
                        .frame(maxWidth: .infinity)
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(height: 120)
                
                Button(action: {
                    action()
                }, label: {
                    BaseText(text: title,
                             font: .title3,
                             fontWeight: .semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .frame(maxWidth: 440)
                })
                .padding()
                .padding(.top)
                .buttonStyle(BaseButtonStyle())
            }
        }
    }
}

#Preview {
    BaseButton(action: { print("Action") },
               title: "Title")
}

struct BaseButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.accentColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
