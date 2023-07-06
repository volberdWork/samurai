import Foundation
import UIKit
import GTProgressBar
import SnapKit

class PreloaderView: UIView {
    private let backgroundImageView: UIImageView = {
        let obj = UIImageView()
        obj.image = UIImage(named: .Images.firstOnboarding)
        return obj
    }()
    
    var progressBar: GTProgressBar = {
        let progressBar = GTProgressBar()
        progressBar.progress = 0.0 // Установите желаемое начальное значение прогресса
        progressBar.barBackgroundColor
        progressBar.barBorderColor = .theme(.switchActive)
        progressBar.barBackgroundColor = .theme(.cellSet)
        progressBar.barFillColor = .theme(.grey)
        progressBar.barBorderWidth = 1.0
        progressBar.barFillInset = 2.0
        progressBar.cornerRadius = 10
        progressBar.displayLabel = false // Установите значение true, если хотите отображать метку прогресса
        return progressBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(backgroundImageView)
        addSubview(progressBar)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        progressBar.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(150.sizeH)
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
    }
}
