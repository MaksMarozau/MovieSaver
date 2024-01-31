import UIKit.UIFont

enum FontStyle: String {
    case regular = "Manrope-Regular"
    case bold = "Manrope-Bold"
    case semiBold = "Manrope-SemiBold"
    case medium = "Manrope-Medium"
    case light = "Manrope-Light"
}


extension UIFont {
    
    static func manrope(ofSize size: CGFloat, style: FontStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
