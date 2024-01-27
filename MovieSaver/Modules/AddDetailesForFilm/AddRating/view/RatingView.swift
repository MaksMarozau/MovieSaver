import UIKit

//MARK: - Final class RatingView

final class RatingView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: RatingPresenterProtocol!
    
    private let ratingLabel = UILabel()
    private let ratingPickerView = UIPickerView()
    private let saveButton = UIButton()
    
    private var rating: String = ""
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingPickerView.delegate = self
        ratingPickerView.dataSource = self
        
        view.addSubViews(with: ratingLabel, ratingPickerView, saveButton)
        
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
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        ratingPickerView.translatesAutoresizingMaskIntoConstraints = false
        ratingPickerView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 32).isActive = true
        ratingPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ratingPickerView.heightAnchor.constraint(equalToConstant: 131).isActive = true
        ratingPickerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: ratingPickerView.bottomAnchor, constant: 32).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 79).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundMain
        
        ratingLabel.setHeadlinesLabelTextAttrs(ofSize: 24)
        ratingLabel.text = "Your Rating"
                        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.blueButton, for: .normal)
        saveButton.titleLabel?.textAlignment = .center
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    
    
//MARK: - Actions
    
    @objc private func saveTapped() {
        
        presenter.saveRating(rating: rating)
    }
}



//MARK: - Extension for RatingView from UIPickerView protocols

extension RatingView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 101
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = String(Double(row) / 10)
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rating = String (row / 10)
    }
}
