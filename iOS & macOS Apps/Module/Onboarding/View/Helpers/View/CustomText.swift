import SwiftUI

struct CustomText: View {
    
    let text: String
    var font: Font? = nil
    var fontWeight: Font.Weight? = nil
    var alignment: TextAlignment? = nil
    var italic: Bool? = nil
    
    var body: some View {
        Text(text)
            .font(font ?? .callout)
            .fontWeight(fontWeight ?? .semibold)
            .fontDesign(.rounded)
            .multilineTextAlignment(alignment ?? .leading)
            .italic(italic ?? false)
    }
}

#Preview {
    CustomText(text: "Test",
               font: .body,
               fontWeight: .regular,
               alignment: .leading,
               italic: true)
}
