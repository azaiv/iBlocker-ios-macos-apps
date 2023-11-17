import SwiftUI

struct PurchaseView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
            ScrollView {
                VStack(spacing: 10) {
                    BaseText(text: "Welcome offer",
                             font: .title3)
                    .foregroundColor(.blue)
                    BaseText(text: "Unlock Everything",
                             font: .title)
                    
                    VStack(alignment: .leading,
                           spacing: 20) {
                        HStack {
                            Image(systemName: "crown")
                                .fontWeight(.bold)
                            BaseText(text: "Now Payment now. Save 75%",
                                     font: .body)
                        }
                        
                        HStack {
                            Image(systemName: "crown")
                                .fontWeight(.bold)
                            BaseText(text: "Stop apps from tracking you",
                                     font: .body)
                        }
                        
                        HStack {
                            Image(systemName: "crown")
                                .fontWeight(.bold)
                            BaseText(text: "Stop Pops and cookies",
                                     font: .body)
                        }
                        
                        HStack {
                            Image(systemName: "crown")
                                .fontWeight(.bold)
                            BaseText(text: "Accelerate your device",
                                     font: .body)
                        }
                        
                        HStack {
                            Image(systemName: "crown")
                                .fontWeight(.bold)
                            BaseText(text: "Save Battery and data",
                                     font: .body)
                        }
                        
                    }
                           .padding(.top, 20)
                    
                    comment()
                        .padding(.top, 20)
                    
                    BaseText(text: "7 days free trial. Then 59.99$ / year")
                    
                    Button(action: {
                        
                    }, label: {
                        BaseText(text: Texts.continue_button,
                                 font: .title3)
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(BaseButtonStyle())
                    HStack {
                        Image(systemName: "checkmark")
                            .fontWeight(.bold)
                        BaseText(text: "No payment now! Save 75%")
                    }
                    .padding(.bottom, 10)
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            VStack(alignment: .leading) {
                                BaseText(text: "Subscribe monthly", fontWeight: .regular)
                                    .foregroundColor(.primary)
                                Spacer()
                                BaseText(text: "$9.99 per month", fontWeight: .regular)
                                    .foregroundColor(.primary)
                            }
                            .padding(.all, 10)
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                BaseText(text: "120$", fontWeight: .regular)
                                    .foregroundColor(.primary)
                                Spacer()
                                BaseText(text: "per year", fontWeight: .regular)
                                    .foregroundColor(.primary)
                            }
                            .padding(.all, 10)
                        }
                        .overlay() {
                            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .stroke(Color.black, lineWidth: 1)
                        }
                        
                    })
                    .buttonStyle(.plain)
                    
                    Button(action: {
                    }, label: {
                        HStack {
                            VStack(alignment: .leading) {
                                BaseText(text: "Subscribe weekly", fontWeight: .regular)
                                    .foregroundColor(.primary)
                                Spacer()
                                BaseText(text: "$4.99 per week", fontWeight: .regular)
                                    .foregroundColor(.primary)
                            }
                            .padding(.all, 10)
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                BaseText(text: "260$", fontWeight: .regular)
                                    .foregroundColor(.primary)
                                Spacer()
                                BaseText(text: "per year", fontWeight: .regular)
                                    .foregroundColor(.primary)
                            }
                            .padding(.all, 10)
                        }
                        .overlay() {
                            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .stroke(Color.black, lineWidth: 1)
                        }
                        
                    })
                    .buttonStyle(.plain)
                    HStack {
                        Button(action: {
                            
                        }, label: {
                            BaseText(text: "Privacy poicy", font: .caption2, fontWeight: .medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        })
                        .buttonStyle(.plain)
                        
                        Button(action: {
                            
                        }, label: {
                            BaseText(text: "Restore purchase", font: .caption2, fontWeight: .medium)
                                .frame(maxWidth: .infinity)
                        })
                        .buttonStyle(.plain)
                        
                        Button(action: {
                            
                        }, label: {
                            BaseText(text: "Terms of use", font: .caption2, fontWeight: .medium)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        })
                        .buttonStyle(.plain)
                    }
                    
                }
                .padding()
            }
    }
    @ViewBuilder
    private func comment() -> some View {
        VStack(spacing: 10) {
            HStack(spacing: 5) {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
            .foregroundColor(.yellow)
            Text("Great app! I give 4 stars so that you don’t get discouraged and make the application only better!")
                .italic()
                .lineLimit(5)
            HStack {
                Spacer()
                Text("azaiv")
                    .frame(alignment: .trailing)
                    .italic()
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    PurchaseView()
}
