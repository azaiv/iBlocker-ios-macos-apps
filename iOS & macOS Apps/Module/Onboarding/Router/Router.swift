import SwiftUI

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case getStarted
        case chooseBlock
        case expierence
        case comments
        case steps
        case notification
    }
    
    @Published var navPath = NavigationPath()
    @Published var destinationType: Destination = .getStarted
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
        destinationType = destination
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
