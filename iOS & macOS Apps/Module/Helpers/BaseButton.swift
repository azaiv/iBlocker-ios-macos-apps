import SwiftUI

struct BaseButton: View {
    
    let action: () -> Void
    let title: String
    var image: String? = nil
    var blur: Bool = true
    var color: Color? = nil
    
    var body: some View {
        
        ZStack {
            if blur {
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
            }
            Button(action: {
                action()
            }, label: {
                BaseText(text: title,
                         font: .title3,
                         image: image,
                         fontWeight: .semibold)
                .frame(maxWidth: 414)
                .frame(height: 48)
            })
            .padding(.horizontal, 20)
            .buttonStyle(BaseButtonStyle(color: color ?? .accentColor))
        }
    }
}

#Preview {
    BaseButton(action: { print("Action") },
               title: "Title",
               color: .green)
}

struct BaseButtonStyle: ButtonStyle {
    
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(color)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
