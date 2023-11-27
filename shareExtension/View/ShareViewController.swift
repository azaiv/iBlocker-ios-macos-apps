import UIKit
import WebKit
import SwiftUI
import Social
import MobileCoreServices
import SafariServices
import UniformTypeIdentifiers

class ShareViewController: UIViewController {
    
    var blockerManager = BlockerManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        if let item = extensionContext?.inputItems.first as? NSExtensionItem,
           let _ = item.attachments?.first as? NSItemProvider {
            if let item = extensionContext?.inputItems.first as? NSExtensionItem,
               let itemProvider = item.attachments?.first as? NSItemProvider,
               itemProvider.hasItemConformingToTypeIdentifier("public.url") {
                itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil) { (url, error) in
                    if let shareURL = url as? URL {
                        DispatchQueue.main.async {
                            self.blockerManager.url = shareURL
                        }
                    }
                    self.extensionContext?.completeRequest(returningItems: [], completionHandler:nil)
                }
            }
        }
    }
    
    @IBSegueAction func toShareWebView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ShareWebView().environmentObject(blockerManager))
    }
    
    func setupNavigationBar() {
        let removeItemsButton = UIBarButtonItem(title: "Remove Items", style: .done, target: self, action: #selector(removeItems))
        let dismissButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissController))
        
        self.navigationItem.rightBarButtonItem = removeItemsButton
        self.navigationItem.leftBarButtonItem = dismissButton
    }
    
    
    @objc func removeItems() {
        let alert = UIAlertController(title: "Warning!", message: "Reload the page for the blocking to work", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
            guard !BlockerManager.stmanager.objectsForRemove.isEmpty else {
                self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
                return
            }
            for index in 0...BlockerManager.stmanager.objectsForRemove.count - 1 {
                BlockerManager().deletejs(self.blockerManager.url!.absoluteString, selector: BlockerManager.stmanager.objectsForRemove[index])
            }
            SFContentBlockerManager.reloadContentBlocker(withIdentifier: "com.iblocker.ios-macos-apps.customRulesExtension", completionHandler: { error in
                if let error = error {
                    print(error.localizedDescription)
                }
            })
            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
        }))
        
        
        let alert2 = UIAlertController(title: "Warning!",
                                       message:
        """
        Are you sure you want to delete  objects? Reload the page for the blocking to work.
        """,
                                       preferredStyle: .alert)
        alert2.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
        }))
        alert2.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .destructive, handler: { _ in
            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
            guard !BlockerManager.stmanager.objectsForRemove.isEmpty else {
                self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
                return
            }
            for index in 0...BlockerManager.stmanager.objectsForRemove.count - 1 {
                BlockerManager().deletejs(self.blockerManager.url!.absoluteString,
                                          selector: BlockerManager.stmanager.objectsForRemove[index])
            }
            SFContentBlockerManager.reloadContentBlocker(withIdentifier: "com.iblocker.ios-macos-apps.customRulesExtension",
                                                         completionHandler: { error in
                if let error = error {
                    print(error.localizedDescription)
                }
            })
            self.dismiss(animated: true, completion: nil)
            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
        }))
        self.present(alert2, animated: true, completion: nil)
    }
    
    @objc func dismissController() {
        self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
    }
}
