
import Foundation
import UIKit

extension UIColor {
    enum ColorType {
        case cellSet
        case darkBlue
        case grey
        case primaryActive
        case primaryDefault
        case primaryHover
        case privaryDisabled
        case switchActive
        case switchDisabled
        case switchBackground
        case textDefault
        case white
        case error
        case gradientBlack
        case gradientBlackWithOpacityZero
        case profileImageBackground
        case progressBarBackground
        case progressBarDays
        case progressBarGB
        case textGray
        case textCurrencyGrey
        
        case gradientYellow
        case gradientLightYellow
        case lightAccentText
        case accentGold
        case inactiveGold
        case darkGold
        case clearBeige
        case beige
        case circleGold
        
        case black
        case goldBlack
        case inactiveText
        case brown
        case silverGradient
        
        case clearRed
        case pinkRed
    }
    
    static func theme(_ colorType: ColorType) -> UIColor {
        var color: UIColor?
        
        switch colorType {
        case .cellSet:
            color = UIColor(named: "CellSet")
        case .darkBlue:
            color = UIColor(named: "DarkBlue")
        case .grey:
            color = UIColor(named: "Grey")
        case .primaryActive:
            color = UIColor(named: "PrimaryActive")
        case .primaryDefault:
            color = UIColor(named: "PrimaryDefault")
        case .primaryHover:
            color = UIColor(named: "PrimaryHover")
        case .privaryDisabled:
            color = UIColor(named: "PrivaryDisabled")
        case .switchActive:
            color = UIColor(named: "SwitchActive")
        case .switchDisabled:
            color = UIColor(named: "SwitchDisabled")
        case .textDefault:
            color = UIColor(named: "TextDefault")
        case .white:
            color = UIColor(named: "White")
        case .error:
            color = UIColor(named: "Error")
        case .gradientBlack:
            color = UIColor(named: "GragientBlack")
        case .gradientBlackWithOpacityZero:
            color = UIColor(named: "GragientBlackOpacityZero")
        case .profileImageBackground:
            color = UIColor(named: "ProfileImageBackground")
        case .progressBarBackground:
            color = UIColor(named: "ProgressBarBackgroung")
        case .progressBarDays:
            color = UIColor(named: "ProgressBarDays")
        case .progressBarGB:
            color = UIColor(named: "ProgressBarGB")
        case .textGray:
            color = UIColor(named: "TextGray")
        case .switchBackground:
            color = UIColor(named: "SwitchBackground")
        case .textCurrencyGrey:
            color = UIColor(named: "TextCurrencyGrey")
        case .gradientYellow:
            color = UIColor(named: "GradientYellow")
        case .gradientLightYellow:
            color = UIColor(named: "GradientYellowLight")
        case .lightAccentText:
            color = UIColor(named: "LightYellow")
        case .accentGold:
            color = UIColor(named: "Gold")
        case .inactiveGold:
            color = UIColor(named: "InactiveGold")
        case .black:
            color = UIColor(named: "Black")
        case .darkGold:
            color = UIColor(named: "DarkGold")
        case .clearBeige:
            color = UIColor(named: "ClearBeige")
        case .beige:
            color = UIColor(named: "Beige")
        case .circleGold:
            color = UIColor(named: "CircleGold")
        case .goldBlack:
            color = UIColor(named: "GoldBlack")
        case .inactiveText:
            color = UIColor(named: "InactiveText")
        case .brown:
            color = UIColor(named: "Brown")
        case .clearRed:
            color = UIColor(named: "ClearRed")
        case .pinkRed:
            color = UIColor(named: "PinkRed")
        case .silverGradient:
            color = UIColor(named: "SilverGradient")
        }
        
        // TODO: remove before project publish
        guard let color = color else {
            fatalError("Color \(colorType) not found")
        }
        
        return color
    }
}
