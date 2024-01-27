import UIKit

//MARK: - Protocols for extention RatingRouter with MVP-archetecture's methods

protocol RatingRouterInputProtocol: AnyObject {
    func back()
}



//MARK: - Final class RatingRouter

final class RatingRouter: RatingRouterInputProtocol {
    
    
//MARK: - Properties of class

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    
    
//MARK: - Initialization of properties

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies

        let view = RatingView()
        let presenter = RatingPresenter()
        view.presenter = presenter
        presenter.router = self
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
//MARK: - Methods from protocol RatingRouterInputProtocol

    func back() {
        navigationController.popViewController(animated: true)
    }
}
