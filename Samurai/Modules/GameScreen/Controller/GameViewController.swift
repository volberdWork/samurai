import UIKit

class GameViewController: UIViewController {
    private var mainView = GameScreenView()
    private var progressTimer: Timer?
    private var currentProgress: CGFloat = 0.0
    
    var time = (UserProgressData.gameLevel * 5) + 45
    var timer:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        mainView.goToMainButton.addTarget(self, action: #selector(goMain), for: .touchUpInside)
    }
    
    @objc private func goMain() {
       
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeLeft
    }
}


