import UIKit

//MARK: - Protocols for extention LinkRouter with MVP-archetecture's methods

protocol LinkRouterInputProtocol: AnyObject {
    func back(link: String)
}



//MARK: - Final class LinkRouter

final class LinkRouter: LinkRouterInputProtocol {
    
    
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

        let view = LinkView()
        let presenter = LinkPresenter(router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
//MARK: - Methods from protocol LinkRouterInputProtocol

    func back(link: String) {
        delegate?.filmDataSave(by: link)
        navigationController.popViewController(animated: true)
    }
}
