import UIKit
import MobileCoreServices

class CustomRequestHandler: NSObject, NSExtensionRequestHandling {
    
    func beginRequest(with context: NSExtensionContext) {
        let userDefaults = UserDefaults(suiteName: "group.iblockertest")!
        
        let path = userDefaults.string(forKey: "JSONFilePathKeyss")!
        
        let url = URL(string: "file://\(path)")
        
        let customAttachment = NSItemProvider(contentsOf: url)!
        
        let item = NSExtensionItem()
        item.attachments = [customAttachment]
        context.completeRequest(returningItems: [item],
                                completionHandler: nil)
    }
}
