
import Foundation
import UIKit
import SnapKit

class CustomButton: UIButton {
    private let customButtonSizeType: ButtonSize
    private var customButtonType: ButtonType {
        didSet {
            handleState()
        }
    }
    
    init(customButtonSizeType: ButtonSize, customButtonType: ButtonType) {
        self.customButtonType = customButtonType
        self.customButtonSizeType = customButtonSizeType
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.layer.cornerRadius = 12.sizeH
        
        self.snp.makeConstraints { make in
            make.height.equalTo(customButtonSizeType.height)
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        handleState()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0.75
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.alpha = 1
        }
    }
}

// MARK: helpers and handlers
extension CustomButton  {
    private func handleState() {
        UIView.animate(withDuration: 0.2) {
       
//            self.setTitleColor(self.customButtonType.titleColor, for: .normal)
        }

    }
    
    func setTitle(_ title: String) {
        super.setTitle(title, for: .normal)
        self.titleLabel?.font = customButtonSizeType.font
    }
    
}


//MARK: enums
extension CustomButton {
    enum ButtonSize {
        case S
        case M
        
        var height: CGFloat {
            switch self {
            case .S:
                return 32.sizeH
            case .M:
                return 56.sizeH
            }
        }
        
        var font: UIFont {
            switch self {
            case .S:
                return UIFont.Rounded(type: .bold, ofSize: 14)
            case .M:
                return UIFont.Rounded(type: .bold, ofSize: 14)
            }
        }
    }
    

}
