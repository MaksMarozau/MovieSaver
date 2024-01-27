import UIKit

//MARK: - Protocols for extention NameRouter with MVP-archetecture's methods

protocol NameRouterInputProtocol: AnyObject {
    func back()
}



//MARK: - Final class NameRouter

final class NameRouter: NameRouterInputProtocol {
    
    
//MARK: - Properties of class

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    
    
//MARK: - Initialization of properties

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies

        let view = NameView()
        let presenter = NamePresenter()
        view.presenter = presenter
        presenter.router = self
        
        navigationController.pushViewController(view, animated: true)
    }
    

    
//MARK: - Methods from protocol NameRouterInputProtocol

    func back() {
        navigationController.popViewController(animated: true)
    }
}
