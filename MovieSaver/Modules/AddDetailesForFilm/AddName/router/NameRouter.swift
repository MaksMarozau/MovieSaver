import UIKit

protocol NameRouterInputProtocol: AnyObject {
    
    func back()
}

final class NameRouter: NameRouterInputProtocol {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = NameView()
        let presenter = NamePresenter()
        view.presenter = presenter
        presenter.router = self
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
