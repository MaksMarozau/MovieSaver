import UIKit

protocol DetailInfoRouterInputProtocol {
    
}

final class DetailInfoRouter: DetailInfoRouterInputProtocol {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow, with movie: Movie) {
        self.navigationController = navigationController
        self.window = window
        
        let view = DetailInfoView()
        let presenter = DetailInfoPresenter(view: view, router: self, movie: movie)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
}
