//MARK: - Protocols for extention NamePresenter with MVP-archetecture's methods

protocol NamePresenterProtocol {
    func saveName(name: String)
}



//MARK: - Final class NamePresenter

final class NamePresenter: NamePresenterProtocol {

    
//MARK: - Properties of class

    private let router: NameRouterInputProtocol
        
    
    
//MARK: - Initialization of properties

    init(router: NameRouterInputProtocol) {
        self.router = router
    }
    
    
    
//MARK: - Methods from protocol NamePresenterProtocol

    func saveName(name: String) {
        router.back(name: name)
    }
}
