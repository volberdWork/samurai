import UIKit
import CHIPageControl

class OnboardingController: UIViewController {
    var mainView = OnboardingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        initViewController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.viewControllers.removeAll(where: { self === $0 })
    }
    
    private func initViewController() {
        mainView.scrollView.delegate = self
        mainView.pageControl.delegate = self
        
        mainView.nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
    }
}

//MARK: - scrollView delegate
extension OnboardingController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        mainView.pageControl.set(progress: Int(pageNumber), animated: true)
    }
}

//MARK: - delegate pageControl
extension OnboardingController: CHIBasePageControlDelegate {
    func didTouch(pager: CHIPageControl.CHIBasePageControl, index: Int) {
        mainView.scrollToPage(page: index)
        mainView.pageControl.set(progress: index, animated: true)
    }
}

//MARK: - helpers
extension OnboardingController {
    private func openMain() {
        let mainNavController = MainNavigationController()
        UIApplication.shared.keyWindow?.rootViewController = mainNavController
    }

    
    private func setNextPage(currentPage: Int) {
        let nextPage = currentPage + 1
        mainView.scrollToPage(page: nextPage)
        mainView.pageControl.set(progress: nextPage, animated: true)
    }
}

//MARK: - targets
extension OnboardingController {
    @objc private func nextButtonTapped(_ sender: UIButton) {
        let currentPage = mainView.pageControl.currentPage
        if currentPage == 2 {
            openMain()
            print("Last")
        } else {
            setNextPage(currentPage: currentPage)
        }
    }
}
