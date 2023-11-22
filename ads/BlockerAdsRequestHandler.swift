import UIKit
import SwiftUI
import MobileCoreServices

class BlockerAdsRequestHandler: NSObject, NSExtensionRequestHandling {
    
    func beginRequest(with context: NSExtensionContext) {
        
        let userDefaults = UserDefaults(suiteName: "group.iblockertest")!
        
        let isDisabled = userDefaults.bool(forKey: GeneralRules.adversting.key)
        
        let attachment = NSItemProvider(contentsOf: Bundle.main.url(forResource: isDisabled ? "blockerAdsList" : "emtyList",
                                                                    withExtension: "json"))!
        
        let item = NSExtensionItem()
        item.attachments = [attachment]
        
        context.completeRequest(returningItems: [item],
                                completionHandler: nil)
    }
}
