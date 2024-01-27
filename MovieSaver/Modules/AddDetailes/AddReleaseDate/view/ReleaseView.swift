import UIKit



protocol RealiseDateViewInputProtocol: AnyObject {
    
    func getDate(date: String)
}

//MARK: - Final class RealiseDateView

final class RealiseDateView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: RealiseDatePresenterProtocol!
    
    private let realiseDateLabel = UILabel()
    private let realiseDatePickerView = UIDatePicker()
    private let saveButton = UIButton()
    
    private let date: Date = Date()
    private var dateStr: String = ""
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubViews(with: realiseDateLabel, realiseDatePickerView, saveButton)
        
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
        
        realiseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        realiseDateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        realiseDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        realiseDateLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        realiseDateLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        realiseDatePickerView.translatesAutoresizingMaskIntoConstraints = false
        realiseDatePickerView.topAnchor.constraint(equalTo: realiseDateLabel.bottomAnchor, constant: 32).isActive = true
        realiseDatePickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        realiseDatePickerView.heightAnchor.constraint(equalToConstant: 131).isActive = true
        realiseDatePickerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: realiseDatePickerView.bottomAnchor, constant: 32).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundMain
        
        realiseDateLabel.setHeadlinesLabelTextAttrs(ofSize: 24)
        realiseDateLabel.text = "Your Rating"
        
        realiseDatePickerView.datePickerMode = .date
        realiseDatePickerView.maximumDate = .now
        realiseDatePickerView.preferredDatePickerStyle = .wheels
        realiseDatePickerView.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
                        
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
        presenter.saveRealiseDate(date: dateStr)
    }
}



//MARK: - Extension of RealiseDateView with RealiseDateViewInputProtocol

extension RealiseDateView: RealiseDateViewInputProtocol {
    
    func getDate(date: String) {
        self.dateStr = date
    }
}
