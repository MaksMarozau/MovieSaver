import UIKit

//MARK: - Protocol for extention AddNewFilmRouter with MVP-archetecture's methods

protocol AddNewFilmRouterInputProtocol {
    
    func back()
    func moveToNameChangePage()
    func moveToRatingChangeList()
    func moveToDataChangeList()
    func moveToLinkChangePage()
}



//MARK: - Final class AddNewFilmRouter

final class AddNewFilmRouter: AddNewFilmRouterInputProtocol {
    
    
//MARK: - Properties of class

    private let navigationController: UINavigationController
    private let window: UIWindow
    
    
    
//MARK: - Initialization

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies

        let view = AddNewFilmView()
        let imagePicker = ImagePickerView()
        let presenter = AddNewFilmPresenter(view: view, router: self, imagePicker: imagePicker)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
    //MARK: - Methods from protocol AddNewFilmRouterInputProtocol

    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func moveToNameChangePage() {
        let _ = NameRouter(navigationController: navigationController, window: window)
    }
    
    func moveToRatingChangeList() {
        let _ = RatingRouter(navigationController: navigationController, window: window)
    }
    
    func moveToDataChangeList() {
        let _ = ReleaseDateRouter(navigationController: navigationController, window: window)
    }
    
    func moveToLinkChangePage() {
        let _ = LinkRouter(navigationController: navigationController, window: window)
    }
}
