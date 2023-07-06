import Foundation
import UIKit

enum MainCellEnum {
    case single
    case storyBack
    case tournament
    case unlimited
    
    var image: String {
        switch self {
        case .single:
            return .Images.single
        case .storyBack:
            return .Images.storyBack
        case .tournament:
            return .Images.tournament
        case .unlimited:
            return .Images.unlimited
        }
    }
    
    var title: String {
        switch self {
        case .single:
            return "single_title".localized()
        case .storyBack:
            return "story_title".localized()
        case .tournament:
            return "tournament_title".localized()
        case .unlimited:
            return "unlimiteed_title".localized()
        }
    }
}

