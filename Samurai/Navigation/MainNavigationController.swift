import Foundation
import UIKit

class MainNavigationController: UINavigationController {

    var vc: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func initViewController() {
        self.isNavigationBarHidden = false
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        
        if let vc = vc {
            self.viewControllers = [vc]
        } else {
            let vc = MainViewController()
            self.viewControllers = [vc]
        }
    }
}
