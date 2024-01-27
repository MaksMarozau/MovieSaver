protocol RatingPresenterProtocol {
    
    func saveRating(rating: String)
}



final class RatingPresenter: RatingPresenterProtocol {

    var router: RatingRouterInputProtocol!
        
    var closure: ((String) -> Void)?
    
    
    func saveRating(rating: String) {
        
        closure?("link")
        print(closure)
        router.back()
    }
}
