import UIKit
import GTProgressBar
import SnapKit

class GameScreenView: UIView {
    
    let backgroundImageView: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.gameScreenBack)
        return obj
    }()
    
    let button: UIButton = {
        let obj = UIButton(type: .custom)
        obj.setImage(UIImage(named: .Images.pause), for: .normal)
        return obj
    }()
    
    var progressBar: GTProgressBar = {
        let obj = GTProgressBar()
        obj.progress = 0.0
        obj.barBorderColor = .theme(.switchActive)
        obj.barBackgroundColor = .theme(.cellSet)
        obj.barFillColor = .theme(.grey)
        obj.barBorderWidth = 1.0
        obj.barFillInset = 2.0
        obj.cornerRadius = 10
        obj.displayLabel = false
        return obj
    }()
    
    var rightView: UIView = {
        var obj = UIView()
        obj.backgroundColor = .theme(.switchActive)
        obj.isHidden = false
        return obj
    }()
    
    var popUpView: UIView = {
        var obj = UIView()
        obj.backgroundColor = .clear
        return obj
    }()
    
    var popUpImageView: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.pausePop)
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    var timerLabel: SamuraiGradientLabel = {
        let obj = SamuraiGradientLabel()
        obj.text = "0:00"
        obj.gradientColors = [UIColor.theme(.white).cgColor, UIColor.theme(.grey).cgColor]
        obj.font = .Rounded(type: .bold, ofSize: 20)
        return obj
    }()
    
    var targetLabel: SamuraiGradientLabel = {
        let obj = SamuraiGradientLabel()
        obj.text = "Targets"
        obj.gradientColors = [UIColor.theme(.white).cgColor, UIColor.theme(.grey).cgColor]
        obj.font = .Rounded(type: .medium, ofSize: 20)
        return obj
    }()
    
    var rightImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.rightImage)
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    var firstRightImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.one)
       
        return obj
    }()
    
    var secondRightImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.two)
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    var thirdRightImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.three)
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    var forthRightImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.four)
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    var fiftRightImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.five)
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    var sixthRightImage: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.six)
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .regular)
        let obj = UIVisualEffectView(effect: blurEffect)
        obj.isHidden = true
        return obj
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .theme(.cellSet)
        collectionView.layer.borderColor = CGColor(red: 251, green: 251, blue: 251, alpha: 1)
        collectionView.layer.borderWidth = 2
        collectionView.layer.cornerRadius = 6
        return collectionView
    }()
    
    var pauseeTitle: UILabel = {
        let obj = UILabel()
        obj.text = "pause_title".localized()
        obj.numberOfLines = 0
        obj.textAlignment = .center
        return obj
    }()
    
    let playButton: UIButton = {
        let obj = UIButton(type: .system)
        obj.setTitle("Play".localized(), for: .normal)
        obj.setTitleColor(.theme(.textGray), for: .normal)
        obj.contentVerticalAlignment = .center
        obj.contentHorizontalAlignment = .center
        obj.clipsToBounds = true
        obj.setBackgroundImage(UIImage(named: "buttonNext"), for: .normal)
        obj.titleLabel?.font = .Bento(type: .normal, ofSize: 24)
        return obj
    }()
    
    let goToMainButton: UIButton = {
        let obj = UIButton(type: .custom)
        obj.setTitle("Go to main", for: .normal)
        obj.setTitleColor(.white, for: .normal)
        obj.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        obj.backgroundColor = .clear
        return obj
    }()
    
    let firsttargetPointLabel: UILabel = {
        let obj = UILabel()
        obj.text = "x15"
        return obj
    }()
    
    let secondTargetPointLabel: UILabel = {
        let obj = UILabel()
        obj.text = "x15"
        return obj
    }()
    
    let thirdTargetPointLabel: UILabel = {
        let obj = UILabel()
        obj.text = "x15"
        return obj
    }()
    
    let forthTargetPointLabel: UILabel = {
        let obj = UILabel()
        obj.text = "x15"
        return obj
    }()
    
    let fiftTargetPointLabel: UILabel = {
        let obj = UILabel()
        obj.text = "x15"
        return obj
    }()
    
    let sistTargetPointLabel: UILabel = {
        let obj = UILabel()
        obj.text = "x15"
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(backgroundImageView)
        addSubview(button)
        addSubview(progressBar)
        addSubview(timerLabel)
        addSubview(rightView)
        rightView.addSubview(rightImage)
        addSubview(blurView)
        blurView.contentView.addSubview(popUpView)
        popUpView.addSubview(popUpImageView)
        popUpView.addSubview(pauseeTitle)
        popUpView.addSubview(goToMainButton)
        popUpView.addSubview(playButton)
        rightView.addSubview(targetLabel)
        rightView.addSubview(firstRightImage)
        rightView.addSubview(secondRightImage)
        rightView.addSubview(thirdRightImage)
        rightView.addSubview(forthRightImage)
        rightView.addSubview(fiftRightImage)
        rightView.addSubview(sixthRightImage)
        addSubview(collectionView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        progressBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(32.sizeH)
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        
        timerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32.sizeH)
            make.leading.equalTo(progressBar.snp.trailing).offset(8.sizeW)
        }
        
        rightView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.width.equalTo(120)
        }
        
        rightImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        popUpView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(36)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-36) 
            make.width.equalToSuperview().multipliedBy(2.0/3.0)
        }
        
        popUpImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        pauseeTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(36)
            make.bottom.equalTo(playButton.snp.top).inset(-16)
            make.leading.equalToSuperview().inset(100)
            make.trailing.equalToSuperview().inset(100)
        }
        
        goToMainButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(8)
        }

        playButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(goToMainButton.snp.top).inset(-8)
            make.height.equalTo(40)
            make.leading.equalToSuperview().inset(66.sizeW)
            make.trailing.equalToSuperview().inset(66.sizeW) // Исправлено на inset, чтобы кнопка не вылезала за границы
        }
        
        targetLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(16)
        }

        firstRightImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(targetLabel.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от targetLabel
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(16)
            make.trailing.equalTo(rightView.snp.leading).inset(-32)
            make.leading.equalToSuperview().offset(100)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(16)
        }

        
//        firsttargetPointLabel.snp.makeConstraints { make in
//            make.leading.equalTo(firstRightImage).inset(6)
//            make.top.equalTo(targetLabel.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от targetLabel
//            make.height.equalTo(25)
//        }

        secondRightImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(firstRightImage.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от firstRightImage
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
//        secondTargetPointLabel.snp.makeConstraints { make in
//            make.leading.equalTo(secondRightImage).inset(6)
//            make.top.equalTo(firsttargetPointLabel.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от targetLabel
//            make.height.equalTo(25)
//        }

        thirdRightImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(secondRightImage.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от secondRightImage
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
//        thirdTargetPointLabel.snp.makeConstraints { make in
//            make.leading.equalTo(thirdRightImage).inset(6)
//            make.top.equalTo(secondTargetPointLabel.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от targetLabel
//            make.height.equalTo(25)
//        }

        forthRightImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(thirdRightImage.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от thirdRightImage
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
//
//        forthTargetPointLabel.snp.makeConstraints { make in
//            make.leading.equalTo(forthRightImage).inset(6)
//            make.top.equalTo(thirdTargetPointLabel.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от targetLabel
//            make.height.equalTo(25)
//        }

        fiftRightImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(forthRightImage.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от forthRightImage
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
//        fiftTargetPointLabel.snp.makeConstraints { make in
//            make.leading.equalTo(fiftRightImage).inset(6)
//            make.top.equalTo(forthTargetPointLabel.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от targetLabel
//            make.height.equalTo(25)
//        }

        sixthRightImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(fiftRightImage.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от fifthRightImage
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
//
//        sistTargetPointLabel.snp.makeConstraints { make in
//            make.leading.equalTo(sixthRightImage).inset(6)
//            make.top.equalTo(fiftTargetPointLabel.snp.bottom).offset(16) // Исправлено на offset для правильного отступа от targetLabel
//            make.height.equalTo(25)
//        }


        

    }
    
    private func setupButtonAction() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(hideBlure), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        blurView.isHidden = false // Скрыть/показать blurView вместе с rightView
    }
    
    @objc private func hideBlure() {
        blurView.isHidden = true // Скрыть/показать blurView вместе с rightView
    }
}

