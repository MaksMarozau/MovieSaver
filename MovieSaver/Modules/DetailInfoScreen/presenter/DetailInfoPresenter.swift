import Foundation

//MARK: - Protocols for extention DetailInfoPresenter with MVP-archetecture's methods

protocol DetailInfoPresenterProtocol {
    
    func linkTapped(link: String)
    func loadData()
}



//MARK: - Final class DetailInfoPresenter

final class DetailInfoPresenter: DetailInfoPresenterProtocol {

    
//MARK: - Properties of class
    
    unowned let view: DetailInfoViewInputProtocol
    private let router: DetailInfoRouterInputProtocol
    private var movie: Movie
    
    
    
//MARK: - Initialization of properties

    init(view: DetailInfoViewInputProtocol, router: DetailInfoRouterInputProtocol, movie: Movie) {
        self.view = view
        self.router = router
        self.movie = movie
    }
    
    
    
//MARK: - Methods from protocol DetailInfoPresenterProtocol

    func loadData() {
        let name = movie.name
        let rating = movie.rating
        let releaseData = movie.releaseData
        let description = movie.description
        let link = movie.youTubeLink
        
        var releaseYear = ""
        var counter = 0
        for i in releaseData {
            if counter >= releaseData.count - 4 {
                releaseYear = releaseYear + "\(i)"
            }
            counter += 1
        }
        view.getData(with: name, rating, releaseYear, description, link)
    }
    
    
    func linkTapped(link: String) {
        if let url = URL(string: link) {
            view.showTrailer(by: url)
        }
    }
}
