import UIKit.UILabel

extension UILabel {
    
    func setStandatrtLabelTextAttrs(with text: String) {
        self.textColor = .fontBlack
        self.font = .manrope(ofSize: 18, style: .medium)
        self.textAlignment = .center
        self.text = text
    }
    
//    func setDescriptionTextAttrs() {
//        self.textColor = .fontBlack
//        self.font = .manrope(ofSize: 14, style: .regular)
//        self.textAlignment = .left
//    }
}
