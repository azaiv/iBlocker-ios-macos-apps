import SwiftUI
import LocalAuthentication

class Authenticate: ObservableObject {
    
    @AppStorage("faceid") var authenticateEnabled: Bool = false
    
    func authenticate() {
        let context = LAContext()
        
        context.localizedCancelTitle = "Enter Username/Password"
        
        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
            return
        }
        
        Task {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Test") { succes, error in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
