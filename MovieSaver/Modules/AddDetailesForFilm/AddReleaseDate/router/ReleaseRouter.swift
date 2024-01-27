import UIKit

protocol ReleaseDateRouterInputProtocol: AnyObject {
    
    func back()
}

final class ReleaseDateRouter: ReleaseDateRouterInputProtocol {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = ReleaseDateView()
        let presenter = ReleaseDatePresenter(view: view)
        view.presenter = presenter
        presenter.router = self
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
