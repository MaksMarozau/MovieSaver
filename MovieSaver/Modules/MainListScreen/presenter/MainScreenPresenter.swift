//MARK: - Protocols for extention MainScreenPresenter with MVP-archetecture's methods

protocol MainScreenPresenterProtocol: AnyObject {
    
    func tableViewsCellTapped(with movie: Movie)
    func addButtonTapped()
    func loadData()
}



//MARK: - Final class MainScreenPresenter

final class MainScreenPresenter: MainScreenPresenterProtocol {
   
    
//MARK: - Properties of class
    
    unowned private let view: MainScreenViewInputProtocol
    private let router: MainScreenRouterInputProtocol
    

    
//MARK: - Initialization of properties
    
    init(view: MainScreenViewInputProtocol, router: MainScreenRouter) {
        self.view = view
        self.router = router
    }
    
    
    
//MARK: - Methods from protocol MainScreenPresenterProtocol
    
    func tableViewsCellTapped(with movie: Movie) {
        router.moveToDetailInfoPage(with: movie)
    }
    
    func addButtonTapped() {
        router.moveToAddNewPage()
    }
    
    func loadData() {
        let result = CoreDataManager.instance.loadMovies()
        switch result {
        case .success(let success):
            view.updateData(success)
        case .failure(let failure):
            print(failure)
        }
    }
}
