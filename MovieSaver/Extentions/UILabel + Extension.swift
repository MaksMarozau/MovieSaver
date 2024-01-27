import UIKit.UILabel

extension UILabel {
    
    func setStandatrtLabelTextAttrs(with text: String) {
        self.textColor = .fontBlack
        self.font = .manrope(ofSize: 18, style: .medium)
        self.textAlignment = .center
        self.text = text
    }
    
    func setPickersTitleLabelTextAttrs(with text: String) {
        self.textColor = .fontBlack
        self.font = .manrope(ofSize: 24, style: .medium)
        self.textAlignment = .center
        self.text = text
    }
}
