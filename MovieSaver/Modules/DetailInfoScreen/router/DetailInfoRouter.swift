import UIKit

//MARK: - Protocols for extention DetailInfoRouter with MVP-archetecture's methods

protocol DetailInfoRouterInputProtocol {
    
}



//MARK: - Final class DetailInfoRouter

final class DetailInfoRouter: DetailInfoRouterInputProtocol {
    
    
//MARK: - Properties of class

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    
    
//MARK: - Initialization of properties

    init(navigationController: UINavigationController, window: UIWindow, with movie: Movie) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies

        let view = DetailInfoView()
        let presenter = DetailInfoPresenter(view: view, router: self, movie: movie)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
}
