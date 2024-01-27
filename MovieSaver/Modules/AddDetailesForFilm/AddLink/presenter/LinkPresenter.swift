protocol LinkPresenterProtocol {
    
    func saveLink(link: String)
}



final class LinkPresenter: LinkPresenterProtocol {

    var router: LinkRouterInputProtocol!
        
    var closure: ((String) -> Void)?
    
    
    func saveLink(link: String) {
        
        closure?("link")
        print(closure)
        router.back()
    }
}
