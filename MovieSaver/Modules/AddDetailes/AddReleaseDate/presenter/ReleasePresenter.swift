import Foundation

protocol RealiseDatePresenterProtocol {
    
    func convertDateToString(date: Date)
    func saveRealiseDate(date: String)
}



final class RealiseDatePresenter: RealiseDatePresenterProtocol {
 
    unowned let view: RealiseDateViewInputProtocol
    var router: RealiseDateRouterInputProtocol!
    
    var closure: ((String) -> Void)?
    
    
    init(view: RealiseDateViewInputProtocol) {
        self.view = view
    }
    
    
    func convertDateToString(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        let dateStr = formatter.string(from: date)
        view.getDate(date: dateStr)
    }
    
    func saveRealiseDate(date: String) {

        closure?("link")
        print(closure)
        router.back()
    }
}
