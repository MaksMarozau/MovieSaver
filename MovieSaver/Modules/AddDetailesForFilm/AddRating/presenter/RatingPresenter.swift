//MARK: - Protocols for extention RatingPresenter with MVP-archetecture's methods

protocol RatingPresenterProtocol {
    func saveRating(rating: String)
}



//MARK: - Final class RatingPresenter

final class RatingPresenter: RatingPresenterProtocol {

    
//MARK: - Properties of class

    private let router: RatingRouterInputProtocol
    
    
    
//MARK: - Initialization of properties

    init(router: RatingRouterInputProtocol) {
        self.router = router
    }
    
    
    
//MARK: - Methods from protocol RatingPresenterProtocol

    func saveRating(rating: String) {
        router.back(rating: rating)
    }
}
