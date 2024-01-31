//MARK: - Protocols for extention LinkPresenter with MVP-archetecture's methods

protocol LinkPresenterProtocol {
    
    func saveLink(link: String)
}



//MARK: - Final class LinkPresenter

final class LinkPresenter: LinkPresenterProtocol {

    
//MARK: - Properties of class

    private let router: LinkRouterInputProtocol
    
    
    
//MARK: - Initialization of properties
    init(router: LinkRouterInputProtocol) {
        self.router = router
    }
        
    
    
//MARK: - Methods from protocol LinkPresenterProtocol

    func saveLink(link: String) {
        router.back(link: link)
    }
}
