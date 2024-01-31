import UIKit

//MARK: - Protocols for extention ReleaseDateView with MVP-archetecture's methods

protocol ReleaseDateViewInputProtocol: AnyObject {
    
    func getDate(date: String)
}



//MARK: - Final class ReleaseDateView

final class ReleaseDateView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: ReleaseDatePresenterProtocol!
    
    private let releaseDateLabel = UILabel()
    private let releaseDatePickerView = UIDatePicker()
    private let saveButton = UIButton()
    
    private let date: Date = Date()
    private var dateStr: String = ""
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubViews(with: releaseDateLabel, releaseDatePickerView, saveButton)
        
        setConstraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
        presenter.convertDateToString(date: date)
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        releaseDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        releaseDateLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        releaseDatePickerView.translatesAutoresizingMaskIntoConstraints = false
        releaseDatePickerView.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 32).isActive = true
        releaseDatePickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        releaseDatePickerView.heightAnchor.constraint(equalToConstant: 131).isActive = true
        releaseDatePickerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: releaseDatePickerView.bottomAnchor, constant: 32).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundMain
        
        releaseDateLabel.setPickersTitleLabelTextAttrs(with: "Your Rating")
        
        releaseDatePickerView.datePickerMode = .date
        releaseDatePickerView.maximumDate = .now
        releaseDatePickerView.preferredDatePickerStyle = .wheels
        releaseDatePickerView.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
                        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.blueButton, for: .normal)
        saveButton.titleLabel?.textAlignment = .center
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions
    
    @objc private func dateSelected(sender: UIDatePicker) {
        let date = sender.date
        presenter.convertDateToString(date: date)
    }
    
    @objc private func saveTapped() {
        presenter.saveReleaseDate(date: dateStr)
    }
}



//MARK: - Extension of ReleaseDateView with ReleaseDateViewInputProtocol

extension ReleaseDateView: ReleaseDateViewInputProtocol {
    
    func getDate(date: String) {
        self.dateStr = date
    }
}
