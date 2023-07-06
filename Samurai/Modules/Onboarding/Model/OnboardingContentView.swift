
import Foundation
import UIKit

class OnboardingContentView: UIView {
    
    private var page: OnboardingModel
    
    private let backgroundImage: UIImageView = {
        let obj = UIImageView()
        obj.contentMode = .redraw
        return obj
    }()
    
    private let gradientView: UIView = {
        let obj = UIView()
        return obj
    }()
    
    private let titleLabel: SamuraiGradientLabel = {
        let obj = SamuraiGradientLabel()
        obj.gradientColors = [UIColor.theme(.white).cgColor, UIColor.theme(.grey).cgColor]
        obj.font = .Rounded(type: .bold, ofSize: 32)
        obj.numberOfLines = 0
        obj.textAlignment = .center
//        obj.lineBreakMode = .byWordWrapping
        return obj
    }()
    
    private let subTitleLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .theme(.white)
        obj.font = .Rounded(type: .medium, ofSize: 16)
        obj.numberOfLines = 0
        obj.textAlignment = .center
//        obj.lineBreakMode = .byWordWrapping
        return obj
    }()
    
    init(page: OnboardingModel) {
        self.page = page
        super.init(frame: .zero)
        setup()
        setupSettings()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientView.layoutIfNeeded()
//        gradientView.applyGradient(colors: [.theme(.theme(.gradientBlackWithOpacityZero)), UIColor.black.cgColor], locations: [0.0, 1.0])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(backgroundImage)
        backgroundImage.addSubview(gradientView)
        gradientView.addSubview(titleLabel)
        gradientView.addSubview(subTitleLabel)
        
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subTitleLabel.snp.top).offset(-16.sizeH)
            make.leading.equalToSuperview().inset(38.sizeW)
            make.trailing.equalToSuperview().offset(-38.sizeW)
        }

        subTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-130.sizeH)
            make.leading.equalToSuperview().inset(69.sizeW)
            make.trailing.equalToSuperview().offset(-69.sizeW)
        }

    }
    
    private func setupSettings() {
        self.backgroundImage.image = page.image
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 1.2
        let titleAttributtedString = NSAttributedString(string: page.title, attributes: [.kern: 1, .paragraphStyle: paragraphStyle])
        self.titleLabel.attributedText = titleAttributtedString
        paragraphStyle.lineHeightMultiple = 1.16
        let subTitleAttributtedString = NSAttributedString(string: page.subTitle, attributes: [.paragraphStyle: paragraphStyle])
        self.subTitleLabel.attributedText = subTitleAttributtedString
    }

}

//MARK: - enum
extension OnboardingContentView {
    enum OnboardingModel {
        case first
        case second
        case third
        
        var title: String {
            switch self {
            case .first:
                return "welcome".localized()
            case .second:
                return "Discover".localized()
            case .third:
                return "Take_Part".localized()
            }
        }
        
        var subTitle: String {
            switch self {
            case .first:
                return "welcome_subtitle".localized()
            case .second:
                return "discover_subtitle".localized()
            case .third:
                return "take_part_subtitle".localized()
            }
        }
        
        var image: UIImage? {
            switch self {
            case .first:
                return UIImage(named: .Images.firstOnboarding)
            case .second:
                return UIImage(named: .Images.secondOnboarding)
            case .third:
                return UIImage(named: .Images.thirdOnboarding)
            }
        }
    }
}

