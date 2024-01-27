//MARK: - Protocols for extention NamePresenter with MVP-archetecture's methods

protocol NamePresenterProtocol {
    func saveName(name: String)
}



//MARK: - NamePresenterDelegate

protocol NamePresenterDelegate: AnyObject {
    func filmNameSaved(by name: String)
}



//MARK: - Final class NamePresenter

final class NamePresenter: NamePresenterProtocol {

    
//MARK: - Properties of class

//    private var name = ""
    var router: NameRouterInputProtocol!
    weak var delegate: NamePresenterDelegate?
    
    var closure: ((String) -> Void)?
    
    
    
//MARK: - Initialization of properties

//    init(router: NameRouterInputProtocol) {
//        self.router = router
//    }
    
    
    
//MARK: - Methods from protocol NamePresenterProtocol

    func saveName(name: String) {
//        self.name = name
        closure?("Mike")
//        print(self.name)
        print(closure)
//        delegate?.filmNameSaved(by: name)
        router.back()
    }
}
