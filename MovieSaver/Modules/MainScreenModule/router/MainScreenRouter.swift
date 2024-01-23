import UIKit

//MARK: - Protocol for extention MainScreenRouter with MVP-archetecture's methods

protocol MainScreenRouterInput {
    
    func tableViewCellTapped()
    func addButtonTapped()
}



//MARK: - Final class MainScreenRouter

final class MainScreenRouter: MainScreenRouterInput {
    
    
//MARK: - Properties of class
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    
    
//MARK: - Initialization
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies
        
        let view = MainScreenViewController()
        let presenter = DefaultMainScreenPresenter(view: view, router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
//MARK: - Methods from protocol MainScreenRouterInput
    
    func tableViewCellTapped() {
        
    }
    
    
    func addButtonTapped() {
        
        navigationController.pushViewController(AddNewViewController(), animated: true)
    }
}
