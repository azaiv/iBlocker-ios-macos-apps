import UIKit
import SwiftUI
import Social
import MobileCoreServices
import SafariServices

class ShareViewController: UIViewController {
    
    var storageManager = BlockerManager()
    var webSiteURL: URL? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        let extensionItem = extensionContext?.inputItems.first as! NSExtensionItem
        let itemProvider = extensionItem.attachments?.first as! NSItemProvider
        let propertyList = String(kUTTypePropertyList)
        if itemProvider.hasItemConformingToTypeIdentifier(propertyList) {
            itemProvider.loadItem(forTypeIdentifier: propertyList, options: nil, completionHandler: { (item, error) -> Void in
                guard let dictionary = item as? NSDictionary else { return }
                OperationQueue.main.addOperation {
                    if let results = dictionary[NSExtensionJavaScriptPreprocessingResultsKey] as? NSDictionary,
                       let urlString = results["URL"] as? String,
                       let url = URL(string: urlString) {
//                        self.storageManager.url = url
                    }
                }
            })
        } else {
           print("error")
        }
    }
    
    @IBSegueAction func containerView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ShareWebView(url: webSiteURL).environmentObject(storageManager))
    }
    
    func setupNavigationBar() {
        let removeItemsButton = UIBarButtonItem(title: "Remove Items", style: .done, target: self, action: #selector(removeItems))
        let dismissButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissController))
        
        self.navigationItem.rightBarButtonItem = removeItemsButton
        self.navigationItem.leftBarButtonItem = dismissButton
    }
    
    
    @objc func removeItems() {
//        let alert = UIAlertController(title: "Warning!", message: "Reload the page for the blocking to work", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
//            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
//            guard !StorageManager.stmanager.objectsForRemove.isEmpty else {
//                self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
//                return
//            }
//            for index in 0...StorageManager.stmanager.objectsForRemove.count - 1 {
//                StorageManager().deletejs(self.storageManager.url!.absoluteString, selector: StorageManager.stmanager.objectsForRemove[index])
//            }
//            SFContentBlockerManager.reloadContentBlocker(withIdentifier: "aiv.AdBlockAppTest.contentBlocker", completionHandler: { error in
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//            })
//            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
//        }))
//
//
//        let alert2 = UIAlertController(title: "Warning!",
//                                       message:
//"""
//Are you sure you want to delete  objects? Reload the page for the blocking to work.
//""",
//                                       preferredStyle: .alert)
//        alert2.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
//            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
//        }))
//        alert2.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .destructive, handler: { _ in
//            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
//            guard !StorageManager.stmanager.objectsForRemove.isEmpty else {
//                self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
//                return
//            }
//            for index in 0...StorageManager.stmanager.objectsForRemove.count - 1 {
//                StorageManager().deletejs(self.storageManager.url!.absoluteString, selector: StorageManager.stmanager.objectsForRemove[index])
//            }
//            SFContentBlockerManager.reloadContentBlocker(withIdentifier: "aiv.AdBlockAppTest.contentBlocker", completionHandler: { error in
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//            })
            self.dismiss(animated: true, completion: nil)
//            self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
//        }))
//        self.present(alert2, animated: true, completion: nil)
    }
    
    @objc func dismissController() {
        self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
    }
}
