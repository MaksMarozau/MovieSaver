import UIKit

protocol RatingRouterInputProtocol: AnyObject {
    
    func back()
}

final class RatingRouter: RatingRouterInputProtocol {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = RatingView()
        let presenter = RatingPresenter()
        view.presenter = presenter
        presenter.router = self
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
