import UIKit

class TermsPrivacyViewController: UIViewController {
    
    private let textView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.backgroundColor = .clear
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    private func setUp() {
        self.view.backgroundColor = .theme(.cellSet)
        textView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textView)
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.text = ""
        textView.textColor = .white.withAlphaComponent(0.8)
        textView.isEditable = false
        //        let customNavigation = CustomNavigationItem()
        //        navigationItem.titleView = customNavigation.setupTitleView(title: "Terms", navigationType: .detail)
        //        navigationItem.leftBarButtonItem = customNavigation.addBarButtonItem(target: self, icon: "backIcon", selector: #selector(didTapLeftBarButtonItem), navigationType: .detail)
        //
        NSLayoutConstraint.activate([
            
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 39),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -39),
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 132),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func didTapLeftBarButtonItem() {
        //        UIDevice.vibrate()
        //        guard let navigationController = navigationController else { return }
        //        let coordinate = MainCoordinator(navigationController: navigationController)
        //        coordinate.popToPreviousVC()
        //    }
    }
}
