import SwiftUI
import WebKit
import SafariServices
import JavaScriptCore

struct ShareWebView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var blockerManager: BlockerManager
    
    @State private var showAlert = false
    @State private var selected = false
    @State private var website = ""
    
    var body: some View {
        if !website.isEmpty {
            WebView(url: blockerManager.url!,
                    showAlert: $showAlert,
                    selected: $selected,
                    website: $website)
        } else {
            ProgressView()
                .onChange(of: blockerManager.url) { _, newValue in
                    if newValue != nil {
                        website = newValue!.absoluteString
                        
                    }
                }
                .progressViewStyle(.circular)
        }
    }
}

