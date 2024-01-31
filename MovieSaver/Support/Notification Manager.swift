import UIKit.UIAlert

//MARK: - Enum Notification, wich includes notifications cases and can create an alert with description of the current notification

enum Notification {
    
    case greeting
    case fieldIsEmpty
    case didNotSave
    case saved
    
    
    //Method of creating the description of the notification with an alert
    func getDescriptionAbout() {
        switch self {
        case .greeting:
            let description = "Hello! I glad to see you! You can make your personal list of movies with this application! Good luck!"
            presentNotifyAlert(with: description)
        case .fieldIsEmpty:
            let description = "You must feel in all the fields!"
            presentNotifyAlert(with: description)
        case .didNotSave:
            let description = "Sorry, but progress hadn't saved..."
            presentNotifyAlert(with: description)
        case .saved:
            let description = "Your movie had saved successfuly!"
            presentNotifyAlert(with: description)
        }
    }
    
    
    //Creating alert with description of the notification
    private func presentNotifyAlert(with decription: String) {
        let alert = UIAlertController(title: "Notification", message: decription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
    }
}
