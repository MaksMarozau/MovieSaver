import UIKit

//MARK: - Protocol for extention AddNewRouterInput with MVP-archetecture's methods

protocol AddNewRouterInput {
    
    func back()
    func moveToNameChangePage()
    func moveToRatingChangeList()
    func moveToDataChangeList()
    func moveToLinkChangeList()
}



//MARK: - Final class AddNewRouter

final class AddNewRouter: AddNewRouterInput {
    
    
//MARK: - Properties of class

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    
    
//MARK: - Initialization

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        //MARK: - Making of dependencies

        let view = AddNewViewController()
        let presenter = DefaultAddNewPresenter(view: view, router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
   
    
    //MARK: - Methods from protocol MainScreenRouterInput

    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func moveToNameChangePage() {
        
    }
    
    func moveToRatingChangeList() {
        
    }
    
    func moveToDataChangeList() {
        
    }
    
    func moveToLinkChangeList() {
        
    }
    
}
