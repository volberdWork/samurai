import UIKit

class GameLoaderController: UIViewController {
    private var mainView = GameLoaderView()
    private var progressTimer: Timer?
    private var currentProgress: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        startProgressBarAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        stopProgressBarAnimation()
    }
    
    private func startProgressBarAnimation() {
        let duration = 2.0
        let step = 1.0 / (duration / 0.02)

        progressTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            self.currentProgress += step
            self.mainView.progressBar.progress = min(self.currentProgress, 1.0)
            
            if self.currentProgress >= 1.0 {
                self.stopProgressBarAnimation()
                
                let onboardingController = GameViewController()
                onboardingController.modalPresentationStyle = .fullScreen
                self.present(onboardingController, animated: true, completion: nil)
            }
        }
    }
    
    private func stopProgressBarAnimation() {
        progressTimer?.invalidate()
        progressTimer = nil
    }
}
