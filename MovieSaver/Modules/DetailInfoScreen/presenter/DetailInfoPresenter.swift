import Foundation
import UIKit.UIImage

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
        let releaseDate = movie.releaseDate
        let description = movie.descript
        let link = movie.link
        let imageData = movie.imageData
        
        if let name, let rating, let releaseDate, let description, let link, let imageData {
            
            var releaseYear = ""
            var counter = 0
            for i in releaseDate {
                if counter >= releaseDate.count - 4 {
                    releaseYear = releaseYear + "\(i)"
                }
                counter += 1
            }
            
            let image = UIImage(data: imageData)
            view.getData(with: name, rating, releaseYear, description, link, image)
        }
    }
    
    
    func linkTapped(link: String) {
        if let url = URL(string: link) {
            view.showTrailer(by: url)
        }
    }
}
