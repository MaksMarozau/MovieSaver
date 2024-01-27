import UIKit

protocol LinkRouterInputProtocol: AnyObject {
    
    func back()
}

final class LinkRouter: LinkRouterInputProtocol {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = LinkView()
        let presenter = LinkPresenter()
        view.presenter = presenter
        presenter.router = self
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
