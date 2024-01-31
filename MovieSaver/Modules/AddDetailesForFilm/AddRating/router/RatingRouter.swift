import UIKit

//MARK: - Protocols for extention RatingRouter with MVP-archetecture's methods

protocol RatingRouterInputProtocol: AnyObject {
    func back(rating: String)
}



//MARK: - Final class RatingRouter

final class RatingRouter: RatingRouterInputProtocol {
    
    
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

        let view = RatingView()
        let presenter = RatingPresenter(router: self)
        view.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
//MARK: - Methods from protocol RatingRouterInputProtocol

    func back(rating: String) {
        delegate?.filmDataSave(by: rating)
        navigationController.popViewController(animated: true)
    }
}
