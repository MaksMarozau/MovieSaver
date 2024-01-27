protocol NamePresenterProtocol {
    
    func saveName(name: String)
}

protocol NamePresenterDelegate: AnyObject {
    
    func filmNameSaved(by name: String)
}



final class NamePresenter: NamePresenterProtocol {

//    private var name = ""
    var router: NameRouterInputProtocol!
    weak var delegate: NamePresenterDelegate?
    
    var closure: ((String) -> Void)?
    
//    init(router: NameRouterInputProtocol) {
//        self.router = router
//    }
    
    
    func saveName(name: String) {
//        self.name = name
        closure?("Mike")
//        print(self.name)
        print(closure)
//        delegate?.filmNameSaved(by: name)
        router.back()
    }
}
