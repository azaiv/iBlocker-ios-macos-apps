import SwiftUI

struct BaseToggleBlock: View {
    
    let title: String
    let checkbox: Bool
    @Binding var isActive: Bool
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            .fill(isActive ? Color.secondary.opacity(0.2) : Color.init(uiColor: .systemBackground))
            .stroke(isActive ? Color.clear : Color.secondary.opacity(0.3))
            .frame(height: 70, alignment: .center)
            .overlay {
                if checkbox {
                    Toggle(isOn: $isActive, label: {
                        BaseText(text: title,
                                 font: .headline,
                                 fontWeight: .semibold)
                    })
                    .padding(.horizontal)
                    .toggleStyle(CheckboxToggleStyle())
                } else {
                    Toggle(isOn: $isActive, label: {
                        BaseText(text: title,
                                 font: .headline,
                                 fontWeight: .semibold)
                        
                    })
                    .padding()
                    
                }
            }
    }
}

#Preview {
    
    BaseToggleBlock(title: "Test",
                    checkbox: false,
                    isActive: .constant(false))
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            if configuration.isOn {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundStyle(Color.blue)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}
