import Foundation

protocol ReleaseDatePresenterProtocol {
    
    func convertDateToString(date: Date)
    func saveReleaseDate(date: String)
}



final class ReleaseDatePresenter: ReleaseDatePresenterProtocol {
 
    unowned let view: ReleaseDateViewInputProtocol
    var router: ReleaseDateRouterInputProtocol!
    
    var closure: ((String) -> Void)?
    
    
    init(view: ReleaseDateViewInputProtocol) {
        self.view = view
    }
    
    
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
