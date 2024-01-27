import Foundation

//MARK: - Protocols for extention ReleaseDatePresenter with MVP-archetecture's methods

protocol ReleaseDatePresenterProtocol {
    
    func convertDateToString(date: Date)
    func saveReleaseDate(date: String)
}



//MARK: - Final class ReleaseDatePresenter

final class ReleaseDatePresenter: ReleaseDatePresenterProtocol {
 
    
//MARK: - Properties of class

    unowned let view: ReleaseDateViewInputProtocol
    var router: ReleaseDateRouterInputProtocol!
    
    var closure: ((String) -> Void)?
    
    
    
//MARK: - Initialization of properties

    init(view: ReleaseDateViewInputProtocol) {
        self.view = view
    }
    
    
    
//MARK: - Methods from protocol ReleaseDatePresenterProtocol

    func convertDateToString(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        let dateStr = formatter.string(from: date)
        view.getDate(date: dateStr)
    }
    
    
    func saveReleaseDate(date: String) {
        closure?("link")
        print(closure)
        router.back()
    }
}
