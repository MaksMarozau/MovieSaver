import UIKit

//MARK: - Final class LinkView

final class LinkView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: LinkPresenter!
    
    private let linkLabel = UILabel()
    private let linkTextField = UITextField()
    private let sepparatorView = UIView()
    private let saveButton = UIButton()
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubViews(with: linkLabel, linkTextField, sepparatorView, saveButton)
        
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
        
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        linkLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        linkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linkLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        linkLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        linkTextField.translatesAutoresizingMaskIntoConstraints = false
        linkTextField.topAnchor.constraint(equalTo: linkLabel.bottomAnchor, constant: 42).isActive = true
        linkTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linkTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        linkTextField.widthAnchor.constraint(equalToConstant: 326).isActive = true
        
        
        sepparatorView.translatesAutoresizingMaskIntoConstraints = false
        sepparatorView.topAnchor.constraint(equalTo: linkTextField.bottomAnchor).isActive = true
        sepparatorView.centerXAnchor.constraint(equalTo: linkTextField.centerXAnchor).isActive = true
        sepparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        sepparatorView.widthAnchor.constraint(equalTo: linkTextField.widthAnchor).isActive = true
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: linkTextField.bottomAnchor, constant: 42).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundMain
        
        linkLabel.setHeadlinesLabelTextAttrs(ofSize: 24)
        linkLabel.text = "YouTube Link"
        
        linkTextField.borderStyle = .none
        linkTextField.placeholder = "Link"
        
        sepparatorView.backgroundColor = .sepparatorGray

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.blueButton, for: .normal)
        saveButton.titleLabel?.textAlignment = .center
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    
    
    //MARK: - Actions

    @objc private func saveTapped() {
        
        guard let link = linkTextField.text else { return }
        presenter.saveLink(link: link)
    }
}
    


    //MARK: - Extention Extention for MainScreenViewController with protocol MainScreenView
