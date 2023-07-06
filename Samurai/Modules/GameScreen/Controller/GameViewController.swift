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
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.goToMainButton.addTarget(self, action: #selector(goMain), for: .touchUpInside)
        mainView.collectionView.register(GridAnimationView.self, forCellWithReuseIdentifier: "Cell")

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.collectionView.visibleCells.forEach { cell in
            let delay = 0.1 * Double(cell.tag)
            cell.transform = CGAffineTransform(translationX: 0, y: mainView.collectionView.bounds.height)
            UIView.animate(withDuration: 0.7, delay: delay, options: .autoreverse, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
        }
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

extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 32 // 4 ряда по 8 ячеек
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! GridAnimationView
            cell.backgroundColor = .theme(.cellSet)
            cell.layer.cornerRadius = 8
            cell.layer.borderColor = UIColor(red: 130/255, green: 251/255, blue: 255/255, alpha: 1).cgColor
            cell.layer.borderWidth = 1
            
            cell.imageView.image = UIImage(named: .Images.one)
            
            // Применение анимации сетки
            let delay = 0.1 * Double(indexPath.item)
            cell.transform = CGAffineTransform(translationX: 0, y: collectionView.bounds.height)
            UIView.animate(withDuration: 0.7, delay: delay, options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.bounds.width - 32) / 9 // Расстояние между ячейками - 8, отступы слева и справа - 8
        return CGSize(width: itemSize, height: itemSize)
    }
}
