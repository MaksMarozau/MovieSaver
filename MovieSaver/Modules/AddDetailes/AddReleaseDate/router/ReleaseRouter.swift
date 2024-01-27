import UIKit

protocol RealiseDateRouterInputProtocol: AnyObject {
    
    func back()
}

final class RealiseDateRouter: RealiseDateRouterInputProtocol {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = RealiseDateView()
        let presenter = RealiseDatePresenter(view: view)
        view.presenter = presenter
        presenter.router = self
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
