import UIKit.UIButton

extension UIButton {
    
    func setChangeButtonAttrs() {
        self.setTitle("Change", for: .normal)
        self.setTitleColor(.blueButton, for: .normal)
        self.titleLabel?.font = .manrope(ofSize: 18, style: .medium)
        self.titleLabel?.textAlignment = .center
    }
}
