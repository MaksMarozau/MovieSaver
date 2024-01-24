import UIKit.UIViewController

//MARK: - Protocol for extention DefaultAddNewPresenter with MVP-archetecture's methods

protocol AddNewPresenter {
    
    func addPosterTapped(with viewController: UIViewController)
    func saveTapped()
    func nameChangeTapped()
    func ratingChangeTapped()
    func dataChangeTapped()
    func linkChangeTapped()
}



//MARK: - Final class DefaultAddNewPresenter

final class DefaultAddNewPresenter: AddNewPresenter  {
    
    
//MARK: - Properties of class
    
    unowned private let view: AddNewView
    private let router: AddNewRouter
    private let imagePicker: ImagePickerView
        

    
//MARK: - Initialization of properties
    
    init(view: AddNewView, router: AddNewRouter, imagePicker: ImagePickerView) {
        self.view = view
        self.router = router
        self.imagePicker = imagePicker
    }
    
    
    
//MARK: - Methods from protocol DefaultAddNewPresenter
    
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
        
    }
    
    func ratingChangeTapped() {
        
    }
    
    func dataChangeTapped() {
        
    }
    
    func linkChangeTapped() {
        
    }
}
