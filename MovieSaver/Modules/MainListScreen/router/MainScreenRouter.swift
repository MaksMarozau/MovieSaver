import UIKit

//MARK: - Protocol for extention MainScreenRouter with MVP-archetecture's methods

protocol MainScreenRouterInputProtocol {
    
    func moveToDetailInfoPage(with movie: Movie)
    func moveToAddNewPage()
}



//MARK: - Final class MainScreenRouter

final class MainScreenRouter: MainScreenRouterInputProtocol {
    
    
//MARK: - Properties of class
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    
    
//MARK: - Initialization
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies
        
        let view = MainScreenView()
        let presenter = MainScreenPresenter(view: view, router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
//MARK: - Methods from protocol MainScreenRouterInputProtocol
    
    func moveToDetailInfoPage(with movie: Movie) {
        let _ = DetailInfoRouter(navigationController: navigationController, window: window, with: movie)
    }
    
    func moveToAddNewPage() {
        let _ = AddNewFilmRouter(navigationController: navigationController, window: window)
    }
}
