import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      
        let screenRect = UIScreen.main.bounds
        window = UIWindow(frame: screenRect)
                    
        if let window = self.window {
            let vc = PreloaderViewController()
            window.rootViewController = vc
            window.makeKeyAndVisible()
        }
        return true
    }
}

