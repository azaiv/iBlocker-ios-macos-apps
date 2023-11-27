import SwiftUI
import WebKit
import SafariServices
import JavaScriptCore

struct WebView: UIViewRepresentable {
    
    let url: URL
    let jsContext = JSContext()
    let contentController = ContentController()
    
    @Binding var showAlert: Bool
    @Binding var selected: Bool
    @Binding var website: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView: WKWebView = {
            let userContentController = WKUserContentController()
            let configuration = WKWebViewConfiguration()
            configuration.userContentController = userContentController
            let preferences = WKPreferences()
            preferences.isTextInteractionEnabled = false
            configuration.preferences = preferences
            
            let webview = WKWebView(frame: .zero, configuration: configuration)
            return webview
        }()
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self,
                    selected: $selected,
                    showAlert: $showAlert,
                    website: $website)
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
        
        jsContext?.isInspectable = true
        webView.isInspectable = true
        webView.allowsLinkPreview = false
        webView.navigationDelegate = context.coordinator
        webView.configuration.userContentController.add(contentController, name: "selectedItem")
    }

    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        let parent: WebView
        
        @Binding var showAlert: Bool
        @Binding var selected: Bool
        @Binding var website: String
        
        init(parent: WebView,
             selected: Binding<Bool>,
             showAlert: Binding<Bool>,
             website: Binding<String>) {
            
            self.parent = parent
            self._selected = selected
            self._showAlert = showAlert
            self._website = website
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            guard let path = Bundle.main.url(forResource: "SelectedItemScript", withExtension: "js") else {
                print(CocoaError.fileNoSuchFile)
                return
            }
            do {
                guard let script = try? String(contentsOf: path) else { return }
                webView.evaluateJavaScript(script)
            }
        }
        
        func webView(_ webView: WKWebView,
                     decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
            
            guard navigationAction.navigationType == .other || navigationAction.navigationType == .reload else {
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }
    }
    
    class ContentController: NSObject, WKScriptMessageHandler {
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "selectedItem" {
                let object = (message.body as? String)!
                if BlockerManager.stmanager.objectsForRemove.contains(object) {
                    if let index = BlockerManager.stmanager.objectsForRemove.firstIndex(where: { $0 == object}) {
                        BlockerManager.stmanager.objectsForRemove.remove(at: index)
                    }
                } else {
                    BlockerManager.stmanager.objectsForRemove.append(object)
                }
            }
        }
    }
}
