//MARK: - Protocols for extention RatingPresenter with MVP-archetecture's methods

protocol RatingPresenterProtocol {
    func saveRating(rating: String)
}



//MARK: - Final class RatingPresenter

final class RatingPresenter: RatingPresenterProtocol {

    
//MARK: - Properties of class

    var router: RatingRouterInputProtocol!
    var closure: ((String) -> Void)?
    
    
    
//MARK: - Methods from protocol RatingPresenterProtocol

    func saveRating(rating: String) {
        
        closure?("link")
        print(closure)
        router.back()
    }
}
