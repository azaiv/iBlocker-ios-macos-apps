import Foundation
import SwiftUI
import SafariServices

struct BlockObject: Hashable {
    let action: String
    let trigger: String
}

class BlockerManager: ObservableObject {
    
    @AppStorage(GeneralRules.adversting.key) var blockAdversting: Bool = false
    @AppStorage(GeneralRules.adult.key) var blockAdult: Bool = false
    @AppStorage(GeneralRules.popUps.key) var blockPopUps: Bool = false
    @AppStorage(GeneralRules.comments.key) var blockComments: Bool = false
    @AppStorage(GeneralRules.trackers.key) var blockTrackers: Bool = false
    @AppStorage(GeneralRules.widgets.key) var blockWidgets: Bool = false
    @AppStorage(GeneralRules.custom.key) var customRules: Bool = false
    
    @Published var url: URL? = nil
    @Published var objectsForRemove: [String] = []
    
    static let stmanager = BlockerManager()
    let sharedDefaults = UserDefaults(suiteName: "group.iblockertest")
    
    func reloadExtension(_ key: String) {
        SFContentBlockerManager.reloadContentBlocker(withIdentifier: key,
                                                     completionHandler: { error in
            if let error = error {
                print(error.localizedDescription)
            }
        })
    }
    
    func updateJSONString(_ webSite: String) {
        if let dir = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.iblockertest") {
            let file = "customBlockerList.json"
            let path = dir.appendingPathComponent(file)

            if FileManager.default.fileExists(atPath: path.path) {
                do {
                    let jsonData = try Data(contentsOf: path)
                    
                    if var existingArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] {
                        let newItem: [String: Any] = ["action": ["type": "block"], "trigger": ["url-filter": "\(webSite.utf8)"]]
                        existingArray.append(newItem)
                        
                        let updatedJsonData = try JSONSerialization.data(withJSONObject: existingArray, options: .prettyPrinted)
                        
                        try updatedJsonData.write(to: path)
                        
                        let usd = UserDefaults(suiteName: "group.iblockertest")
                        usd!.set(path.path(), forKey: "JSONFilePathKeyss")
                        usd!.synchronize()
                    } else {
                        print("Error")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                do {
                    let newArray: [[String: Any]] = []
                    
                    let newJsonData = try JSONSerialization.data(withJSONObject: newArray, options: .prettyPrinted)
                    
                    try newJsonData.write(to: path)
                    
                    updateJSONString(webSite)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func parseJSONFile() -> [String]? {
        if let dir = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.iblockertest") {
            let file = "customBlockerList.json"
            let path = dir.appendingPathComponent(file)

            do {
                let jsonData = try Data(contentsOf: path)

                if let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] {
                    var webSites: [String] = []

                    for item in jsonArray {
                        if let triggerDict = item["trigger"] as? [String: Any],
                           let urlFilter = triggerDict["url-filter"] as? String {
                            webSites.append(urlFilter)
                        }
                    }
                    return webSites
                } else {
                    return nil
                }
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func deletejs(_ webSite: String, selector: String) {
        
        let userDefaults = UserDefaults(suiteName: "group.iblockertest")!
        let path = userDefaults.string(forKey: "JSONFilePathKeyss")!
        let url = URL(string: "file://\(path)")
        
        if FileManager.default.fileExists(atPath: url!.absoluteString) {
            do {
                let jsonData = try Data(contentsOf: url!)
                
                if var existingArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] {
                    let newItem: [String: Any] = [
                        "action": ["type": "css-display-none", "selector": selector],
                        "trigger": [
                            "url-filter": "\(webSite).*"
                        ]
                    ]
                    
                    existingArray.append(newItem)
                    
                    let updatedJsonData = try JSONSerialization.data(withJSONObject: existingArray, options: .prettyPrinted)
                    
                    try updatedJsonData.write(to: url!)
                    print("JSON файл успешно обновлен.")
                } else {
                    print("Ошибка при декодировании существующего JSON.")
                }
            } catch {
                print("Ошибка: \(error.localizedDescription)")
            }
        } else {
            print("JSON файл не существует. Создайте новый JSON файл.")
        }
    }
}
