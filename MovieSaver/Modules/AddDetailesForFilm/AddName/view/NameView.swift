import UIKit

//MARK: - Final class NameView

final class NameView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: NamePresenterProtocol!
    
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let sepparatorView = UIView()
    private let saveButton = UIButton()
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubViews(with: nameLabel, nameTextField, sepparatorView, saveButton)
        
        setConstraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {

        navigationController?.navigationBar.isHidden = true
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 42).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 326).isActive = true
        
        
        sepparatorView.translatesAutoresizingMaskIntoConstraints = false
        sepparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        sepparatorView.centerXAnchor.constraint(equalTo: nameTextField.centerXAnchor).isActive = true
        sepparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        sepparatorView.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 42).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundMain
        
        nameLabel.setPickersTitleLabelTextAttrs(with: "Film Name")
        
        nameTextField.borderStyle = .none
        nameTextField.placeholder = "Name"
        
        sepparatorView.backgroundColor = .sepparatorGray

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.blueButton, for: .normal)
        saveButton.titleLabel?.textAlignment = .center
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    
    
    //MARK: - Actions

    @objc private func saveTapped() {
        
        guard let name = nameTextField.text else { return }
        presenter.saveName(name: name)
    }
}
