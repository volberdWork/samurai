import Foundation
import UIKit


enum Rounded: String {
    case bold = "SFProRounded-Bold"
    case medium = "SFProRounded-Thin"
}

enum Bento: String {
    case normal = "Bento"
}

enum Relative: String {
    case bold = "Relative-Bold"
    case book = "Relative-Book"
    case medium = "Relative-Medium"
}

extension UIFont {
    static func Rounded(type: Rounded, ofSize: CGFloat) -> UIFont {
        if let font = UIFont(name: type.rawValue, size: ofSize) {
            return font
        } else {
            return .systemFont(ofSize: ofSize)
        }
    }
    
    static func Bento(type: Bento, ofSize: CGFloat) -> UIFont {
        if let font = UIFont(name: type.rawValue, size: ofSize) {
            return font
        } else {
            return .systemFont(ofSize: ofSize)
        }
    }
    
    static func Relative(type: Relative, ofSize: CGFloat) -> UIFont {
        if let font = UIFont(name: type.rawValue, size: ofSize) {
            return font
        } else {
            return .systemFont(ofSize: ofSize)
        }
    }
}
