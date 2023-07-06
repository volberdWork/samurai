import Foundation
import UIKit.UIImage

enum SettingstModel: CaseIterable {
    case leaderBoard
    case policy
    case terms
    case shareUpp
    case notification
    case vibration
    case rateUs
    case feedback
    
    var icon: UIImage? {
        switch self {
        case .leaderBoard:
            return UIImage(named: .Images.arrow)
        case .policy:
            return UIImage(named: .Images.arrow)
        case .terms:
            return UIImage(named: .Images.arrow)
        case .shareUpp:
            return UIImage(named: .Images.arrow)
        case .notification:
            return UIImage(named: .Images.arrow)
        case .vibration:
            return UIImage(named: .Images.arrow)
        case .rateUs:
            return UIImage(named: .Images.arrow)
        case .feedback:
            return UIImage(named: .Images.arrow)
        }
    }
    
    var title: String {
        switch self {
        case .leaderBoard:
            return "leaderBoard".localized()
        case .policy:
            return "policy".localized()
        case .terms:
            return "terms".localized()
        case .shareUpp:
            return "shareApp".localized()
        case .notification:
            return "notification".localized()
        case .vibration:
            return "vibration".localized()
        case .rateUs:
            return "rateUss".localized()
        case .feedback:
            return "feedback".localized()
        }
    }
    
    var subTitle: String {
        switch self {
        case .leaderBoard:
            return "leaderBoard_subtitle".localized()
        case .policy:
            return "policy_subtitle".localized()
        case .terms:
            return "terms_subtitle".localized()
        case .shareUpp:
            return "share_subtitle".localized()
        case .notification:
            return "notification_subtitle".localized()
        case .vibration:
            return "vibration_subtitle".localized()
        case .rateUs:
            return "rate_subtitle".localized()
        case .feedback:
            return "feedback_subtitle".localized()
        }
    }
}
