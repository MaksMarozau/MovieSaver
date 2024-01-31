import UIKit

//MARK: - Protocols for extention NameRouter with MVP-archetecture's methods

protocol NameRouterInputProtocol: AnyObject {
    func back(name: String)
}



//MARK: - Final class NameRouter

final class NameRouter: NameRouterInputProtocol {
    
    
//MARK: - Properties of class

    private let navigationController: UINavigationController
    private let window: UIWindow
    weak var delegate: AddFilmDataDelegate?
    
    
//MARK: - Initialization of properties

    init(navigationController: UINavigationController, window: UIWindow, delegate: AddFilmDataDelegate) {
        self.navigationController = navigationController
        self.window = window
        self.delegate = delegate
        
        
        //MARK: - Making of dependencies

        let view = NameView()
        let presenter = NamePresenter(router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    

    
//MARK: - Methods from protocol NameRouterInputProtocol

    func back(name: String) {
        delegate?.filmDataSave(by: name)
        navigationController.popViewController(animated: true)
    }
}
