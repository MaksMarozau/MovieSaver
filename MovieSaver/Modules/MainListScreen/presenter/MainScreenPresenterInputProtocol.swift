//MARK: - Protocols for extention MainScreenPresenter with MVP-archetecture's methods

protocol MainScreenPresenterProtocol: AnyObject {
    
    func tableViewsCellTapped()
    func addButtonTapped()
    func loadData()
}



//MARK: - Final class MainScreenPresenter

final class MainScreenPresenter: MainScreenPresenterProtocol {
   
    
//MARK: - Properties of class
    
    unowned private let view: MainScreenViewInputProtocol
    private let router: MainScreenRouterInput
    
    private var moviesDataArray: [Movie] = []
    

    
//MARK: - Initialization of properties
    
    init(view: MainScreenViewInputProtocol, router: MainScreenRouter) {
        self.view = view
        self.router = router
    }
    
    
    
//MARK: - Methods from protocol MainScreenPresenterProtocol
    
    func tableViewsCellTapped() {
        router.moveToDetailInfoPage()
    }
    
    func addButtonTapped() {
        router.moveToAddNewPage()
    }
    
    func loadData() {
        view.updateData(moviesDataArray)
    }
}
