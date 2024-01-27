import UIKit.UIView

//MARK: - Extention for UIView to adding more then one subViews

extension UIView {
    
    func addSubViews(with views: UIView...) {
        views.forEach( { addSubview($0) } )
    }
}
