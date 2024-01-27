import UIKit.UIViewController

//MARK: - Protocol for extention AddNewFilmPresenter with MVP-archetecture's methods

protocol AddNewFilmPresenterProtocol {
    
    func addPosterTapped(with viewController: UIViewController)
    func saveTapped()
    func nameChangeTapped()
    func ratingChangeTapped()
    func dataChangeTapped()
    func linkChangeTapped()
    func viewWillAppear()
}



//MARK: - Final class AddNewFilmPresenter

final class AddNewFilmPresenter: AddNewFilmPresenterProtocol  {
    
    
//MARK: - Properties of class
    
    unowned private let view: AddNewFilmViewInputProtocol
    private let router: AddNewFilmRouterInput
    private let imagePicker: ImagePickerView
        
    private let namePresenter = NamePresenter()
    
    private var name: String? {
        didSet {
            if let name {
                view.updateNameLabel(name: name)
            }
        }
    }
        

    
//MARK: - Initialization of properties
    
    init(view: AddNewFilmViewInputProtocol, router: AddNewFilmRouterInput, imagePicker: ImagePickerView) {
        self.view = view
        self.router = router
        self.imagePicker = imagePicker
        
        namePresenter.delegate = self
    }
    
    
    
//MARK: - Methods from protocol AddNewFilmPresenter
    
    func viewWillAppear() {
        namePresenter.closure = { [weak self] text in
            print(text)
            self?.name = text
        }
    }
    
    
    func saveTapped() {
        router.back()
    }
    
    
    func addPosterTapped(with viewController: UIViewController) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.imagePicker.showImagePickerController(on: viewController, with: .camera)
            self.imagePicker.onImagePicked = { [weak self] image in
                self?.view.updatePosterImageView(image: image)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { action in
            self.imagePicker.showImagePickerController(on: viewController, with: .gallery)
            self.imagePicker.onImagePicked = { [weak self] image in
                self?.view.updatePosterImageView(image: image)
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
        
    }
    
    func linkChangeTapped() {
        router.moveToLinkChangePage()
    }
}



extension AddNewFilmPresenter: NamePresenterDelegate {
    
    func filmNameSaved(by name: String) {
        self.name = name
    }
    
    
 
    
    
    
}
