import UIKit.UIViewController

//MARK: - Protocol for extention AddNewFilmPresenter with MVP-archetecture's methods

protocol AddNewFilmPresenterOutputProtocol {
    
    func addPosterTapped(with viewController: UIViewController)
    func saveTapped(with description: String?)
    func nameChangeTapped()
    func ratingChangeTapped()
    func dataChangeTapped()
    func linkChangeTapped()
}



protocol AddNewFilmPresenterInputProtocol {
    
    func filmNameSave(by name: String?, rating: String?, release: String?, link: String?)
}



//MARK: - Final class AddNewFilmPresenter

final class AddNewFilmPresenter: AddNewFilmPresenterOutputProtocol  {
    
    
//MARK: - Properties of class
    
    unowned private let view: AddNewFilmViewInputProtocol
    private let router: AddNewFilmRouterInputProtocol
    private let imagePicker: ImagePickerView
            
    private var name: String? {
        didSet {
            if let name {
                view.updateNameLabel(name: name)
            }
        }
    }
    
    private var rating: String? {
        didSet {
            if let rating {
                view.updateRatingLabel(rating: rating)
            }
        }
    }
    
    private var release: String? {
        didSet {
            if let release {
                view.updateReleaseDataLabel(data: release)
            }
        }
    }
    
    private var link: String? {
        didSet {
            if let link {
                view.updateLinkLabel(link: link)
            }
        }
    }
    
    private var image: UIImage? {
        didSet {
            if let image {
                view.updatePosterImageView(image: image)
            }
        }
    }
    
    private var description: String?
        

    
//MARK: - Initialization of properties
    
    init(view: AddNewFilmViewInputProtocol, router: AddNewFilmRouterInputProtocol, imagePicker: ImagePickerView) {
        self.view = view
        self.router = router
        self.imagePicker = imagePicker
    }
    
    
    
//MARK: - Methods from protocol AddNewFilmPresenter
    
    func saveTapped(with description: String?) {
        
        self.description = description
        
        guard let name, let rating, let release, let link, let image, let description else { Notification.fieldIsEmpty.getDescriptionAbout(); return }
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            let result = CoreDataManager.instance.saveMovie(name: name, rating: rating, release: release, link: link, image: image, description: description)
            switch result {
            case .success(_):
                print("Saved")
                DispatchQueue.main.async {
                    Notification.saved.getDescriptionAbout()
                }
            case .failure(let failure):
                print("\(failure)")
                DispatchQueue.main.async {
                    Notification.didNotSave.getDescriptionAbout()
                }
            }
        }
        self.router.back()
    }
    
    
    func addPosterTapped(with viewController: UIViewController) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.imagePicker.showImagePickerController(on: viewController, with: .camera)
            self.imagePicker.onImagePicked = { [weak self] image in
                self?.image = image
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { action in
            self.imagePicker.showImagePickerController(on: viewController, with: .gallery)
            self.imagePicker.onImagePicked = { [weak self] image in
                self?.image = image
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        viewController.present(actionSheet, animated: true)
    }
    
    
    func nameChangeTapped() {
        router.moveToNameChangePage()
    }
    
    func ratingChangeTapped() {
        router.moveToRatingChangeList()
    }
    
    func dataChangeTapped() {
        router.moveToReleaseDataChangeList()
    }
    
    func linkChangeTapped() {
        router.moveToLinkChangePage()
    }
}



//MARK: - Extension for AddNewFilmPresenter with AddNewFilmPresenterInputProtocol

extension AddNewFilmPresenter: AddNewFilmPresenterInputProtocol {
    
    func filmNameSave(by name: String?, rating: String?, release: String?, link: String?) {
        if let name {
            self.name = name
        }
        if let rating {
            self.rating = rating
        }
        if let release {
            self.release = release
        }
        if let link {
            self.link = link
        }
    }
}
