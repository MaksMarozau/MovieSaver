//MARK: - Protocols for extention LinkPresenter with MVP-archetecture's methods

protocol LinkPresenterProtocol {
    
    func saveLink(link: String)
}



//MARK: - Final class LinkPresenter

final class LinkPresenter: LinkPresenterProtocol {

    
//MARK: - Properties of class

    var router: LinkRouterInputProtocol!
        
    var closure: ((String) -> Void)?
    
  
    
//MARK: - Methods from protocol LinkPresenterProtocol

    func saveLink(link: String) {
        closure?("link")
        print(closure)
        router.back()
    }
}
