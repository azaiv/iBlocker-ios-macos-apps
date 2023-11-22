import SwiftUI
import WebKit
import SafariServices
import JavaScriptCore

struct ShareWebView: View {
    
    @EnvironmentObject var storageManager: BlockerManager
    @Environment(\.dismiss) var dismiss
    
    var url: URL?
    @State private var showAlert = false
    @State private var selected = false
    @State private var website = ""
    
    var body: some View {
//        if storageManager.url != nil {
//            WebView(url: storageManager.url!,
//                    showAlert: $showAlert,
//                    selected: $selected,
//                    website: $website)
//        } else {
            ProgressView()
                .progressViewStyle(.circular)
//        }
    }
}
