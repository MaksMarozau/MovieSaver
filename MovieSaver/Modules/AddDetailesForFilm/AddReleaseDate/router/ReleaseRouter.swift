import UIKit

//MARK: - Protocols for extention ReleaseDateRouter with MVP-archetecture's methods

protocol ReleaseDateRouterInputProtocol: AnyObject {
    func back()
}



//MARK: - Final class ReleaseDateRouter

final class ReleaseDateRouter: ReleaseDateRouterInputProtocol {
    
    
    
    //MARK: - Properties of class

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    
    
//MARK: - Initialization of properties

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies

        let view = ReleaseDateView()
        let presenter = ReleaseDatePresenter(view: view)
        view.presenter = presenter
        presenter.router = self
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
//MARK: - Methods from protocol ReleaseDateRouterInputProtocol

    func back() {
        navigationController.popViewController(animated: true)
    }
}
