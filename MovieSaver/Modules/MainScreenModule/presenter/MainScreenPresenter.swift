//MARK: - Protocol for extention DefaultMainScreenPresenter with MVP-archetecture's methods

protocol MainScreenPresenter: AnyObject {
    
    func tableViewsCellTapped()
    func addButtonTapped()
    func loadData()
}



//MARK: - Final class DefaultMainScreenPresenter

final class DefaultMainScreenPresenter: MainScreenPresenter {
   
    
//MARK: - Properties of class
    
    unowned private let view: MainScreenView
    private let router: MainScreenRouterInput
    
    private var moviesDataArray: [Movie] = []
    

    
//MARK: - Initialization of properties
    
    init(view: MainScreenView, router: MainScreenRouter) {
        self.view = view
        self.router = router
    }
    
    
    
//MARK: - Methods from protocol MainScreenPresenter
    
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
