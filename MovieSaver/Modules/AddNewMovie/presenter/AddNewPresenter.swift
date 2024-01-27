
//MARK: - Protocol for extention DefaultAddNewPresenter with MVP-archetecture's methods

protocol AddNewPresenter {
    
    func saveTapped()
    func nameChangeTapped()
    func ratingChangeTapped()
    func dataChangeTapped()
    func linkChangeTapped()
    func addPosterTapped()
}



//MARK: - Final class DefaultAddNewPresenter

final class DefaultAddNewPresenter: AddNewPresenter  {
    
    
//MARK: - Properties of class
    
    unowned private let view: AddNewView
    private let router: AddNewRouter
        

    
//MARK: - Initialization of properties
    
    init(view: AddNewView, router: AddNewRouter) {
        self.view = view
        self.router = router
    }
    
    
    
//MARK: - Methods from protocol DefaultAddNewPresenter
    
    func saveTapped() {
        router.back()
    }
    
    func nameChangeTapped() {
        
    }
    
    func ratingChangeTapped() {
        
    }
    
    func dataChangeTapped() {
        
    }
    
    func linkChangeTapped() {
        
    }
    
    func addPosterTapped() {
        
    }
}
