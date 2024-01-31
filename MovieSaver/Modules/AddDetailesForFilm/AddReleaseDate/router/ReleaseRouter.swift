import UIKit

//MARK: - Protocols for extention ReleaseDateRouter with MVP-archetecture's methods

protocol ReleaseDateRouterInputProtocol: AnyObject {
    func back(date: String)
}



//MARK: - Final class ReleaseDateRouter

final class ReleaseDateRouter: ReleaseDateRouterInputProtocol {
    
    
    
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

        let view = ReleaseDateView()
        let presenter = ReleaseDatePresenter(view: view, router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
//MARK: - Methods from protocol ReleaseDateRouterInputProtocol

    func back(date: String) {
        delegate?.filmDataSave(by: date)
        navigationController.popViewController(animated: true)
    }
}
