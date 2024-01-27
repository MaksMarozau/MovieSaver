import UIKit

//MARK: - Protocols for extention LinkRouter with MVP-archetecture's methods

protocol LinkRouterInputProtocol: AnyObject {
    func back()
}



//MARK: - Final class LinkRouter

final class LinkRouter: LinkRouterInputProtocol {
    
    
//MARK: - Properties of class

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    
    
//MARK: - Initialization of properties

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies

        let view = LinkView()
        let presenter = LinkPresenter()
        view.presenter = presenter
        presenter.router = self
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
//MARK: - Methods from protocol LinkRouterInputProtocol

    func back() {
        navigationController.popViewController(animated: true)
    }
}
