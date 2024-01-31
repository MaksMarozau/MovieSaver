import UIKit

//MARK: - Protocol for extention AddNewFilmRouter with MVP-archetecture's methods

protocol AddNewFilmRouterInputProtocol {
    
    func back()
    func moveToNameChangePage()
    func moveToRatingChangeList()
    func moveToReleaseDataChangeList()
    func moveToLinkChangePage()
}



//MARK: - Final class AddNewFilmRouter

final class AddNewFilmRouter: AddNewFilmRouterInputProtocol {
    
    
    //MARK: - Properties of class
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    private var presenter: AddNewFilmPresenterInputProtocol?
    
    private enum DataSwitcher {
        case name
        case rating
        case release
        case link
        case none
    }
    
    private var dataSwitcher: DataSwitcher = .none
    
    
    
    //MARK: - Initialization
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
        //MARK: - Making of dependencies
        
        let view = AddNewFilmView()
        let imagePicker = ImagePickerView()
        let presenter = AddNewFilmPresenter(view: view, router: self, imagePicker: imagePicker)
        view.presenter = presenter
        
        self.presenter = presenter
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
    //MARK: - Methods from protocol AddNewFilmRouterInputProtocol
    
    func back() {
        navigationController.popViewController(animated: true)
    }
    
    func moveToNameChangePage() {
        dataSwitcher = .name
        let _ = NameRouter(navigationController: navigationController, window: window, delegate: self)
    }
    
    func moveToRatingChangeList() {
        dataSwitcher = .rating
        let _ = RatingRouter(navigationController: navigationController, window: window, delegate: self)
    }
    
    func moveToReleaseDataChangeList() {
        dataSwitcher = .release
        let _ = ReleaseDateRouter(navigationController: navigationController, window: window, delegate: self)
    }
    
    func moveToLinkChangePage() {
        dataSwitcher = .link
        let _ = LinkRouter(navigationController: navigationController, window: window, delegate: self)
    }
}


    
//MARK: - Extention for AddNewFilmRouter with AddFilmDataDelegate protocol

extension AddNewFilmRouter: AddFilmDataDelegate {
        
    func filmDataSave(by data: String) {
        guard let presenter else { return }
        switch dataSwitcher {
        case .name:
            presenter.filmNameSave(by: data, rating: nil, release: nil, link: nil)
        case .rating:
            presenter.filmNameSave(by: nil, rating: data, release: nil, link: nil)
        case .release:
            presenter.filmNameSave(by: nil, rating: nil, release: data, link: nil)
        case .link:
            presenter.filmNameSave(by: nil, rating: nil, release: nil, link: data)
        case .none:
            return
        }
    }
}
