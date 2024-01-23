import UIKit

//MARK: - Protocol for extention MainScreenViewController with MVP-archetecture's methods



//MARK: - Final class AddNewViewController

final class AddNewViewController: UIViewController {
    
    
//MARK: - Properties of class
   
    private let mainContainerView = UIView()
    
    private let topContainerView = UIView()
    private let middleContainerView = UIView()
    private let botContainerView = UIView()
    
    private let posterView = UIView()
    private let posterImageView = UIImageView()
    
    private let horizontalStackView = UIStackView()
    private let firstverticalStackView = UIStackView()
    private let secondverticalStackView = UIStackView()
    
    private let nameView = UIView()
    private let ratingView = UIView()
    private let dataView = UIView()
    private let linkView = UIView()
    
    private let nameStackView = UIStackView()
    private let ratingStackView = UIStackView()
    private let dataStackView = UIStackView()
    private let linkStackView = UIStackView()
    
    private let nameLabel = UILabel()
    private let nameValueLabel = UILabel()
    private let nameChangeButton = UIButton()
    
    private let ratingLabel = UILabel()
    private let ratingValueLabel = UILabel()
    private let ratingChangeButton = UIButton()
    
    private let dataLabel = UILabel()
    private let dataValueLabel = UILabel()
    private let dataChangeButton = UIButton()
    
    private let linkLabel = UILabel()
    private let linkValueLabel = UILabel()
    private let linkChangeButton = UIButton()
    
    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()

    
    
    //MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setCornerRadius()
    }
    
    
 
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Add new"
//        navigationController?.navigationBar.topItem?.backBarButtonItem?.isHidden = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: { [ weak self ] _ in
            
        }))
    }
    
    
    
//MARK: - Add subViews
    
    private func addSubviews() {
        
        view.addSubview(mainContainerView)
        mainContainerView.addSubViews(with: topContainerView, middleContainerView, botContainerView)
        
        //top view's subViews
        topContainerView.addSubview(posterView)
        posterView.addSubview(posterImageView)
        
        //middle view's subViews
        middleContainerView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubviews(with: firstverticalStackView, secondverticalStackView)
        firstverticalStackView.addArrangedSubviews(with: nameView, dataView)
        secondverticalStackView.addArrangedSubviews(with: ratingView, linkView)
        
        nameView.addSubview(nameStackView)
        ratingView.addSubview(ratingStackView)
        dataView.addSubview(dataStackView)
        linkView.addSubview(linkStackView)
        
        nameStackView.addArrangedSubviews(with: nameLabel, nameValueLabel, nameChangeButton)
        ratingStackView.addArrangedSubviews(with: ratingLabel, ratingValueLabel, ratingChangeButton)
        dataStackView.addArrangedSubviews(with: dataLabel, dataValueLabel, dataChangeButton)
        linkStackView.addArrangedSubviews(with: linkLabel, linkValueLabel, linkChangeButton)
        
        //bottom view's subViews
        botContainerView.addSubViews(with: descriptionLabel, descriptionTextView)
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        //Main container view
        mainContainerView.translatesAutoresizingMaskIntoConstraints = false
        mainContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        mainContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        mainContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        mainContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -7).isActive = true
        
        
        //Main container view's subViews
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: mainContainerView.topAnchor, constant: 16).isActive = true
        topContainerView.widthAnchor.constraint(equalTo: mainContainerView.widthAnchor, multiplier: 1).isActive = true
        topContainerView.heightAnchor.constraint(equalToConstant: 171).isActive = true
        
        middleContainerView.translatesAutoresizingMaskIntoConstraints = false
        middleContainerView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 16).isActive = true
        middleContainerView.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor, constant: 8).isActive = true
        middleContainerView.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor, constant: -8).isActive = true
        middleContainerView.heightAnchor.constraint(equalToConstant: 198).isActive = true
                
        botContainerView.translatesAutoresizingMaskIntoConstraints = false
        botContainerView.topAnchor.constraint(equalTo: middleContainerView.bottomAnchor, constant: 36).isActive = true
        botContainerView.widthAnchor.constraint(equalTo: mainContainerView.widthAnchor, multiplier: 1).isActive = true
        botContainerView.bottomAnchor.constraint(equalTo: mainContainerView.bottomAnchor, constant: -5).isActive = true
        
        
        //Top view's subViews
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        posterView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        posterView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        posterView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.centerXAnchor.constraint(equalTo: posterView.centerXAnchor).isActive = true
        posterImageView.centerYAnchor.constraint(equalTo: posterView.centerYAnchor).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true

        
        //Middle view's subViews
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.heightAnchor.constraint(equalTo: middleContainerView.heightAnchor).isActive = true
        horizontalStackView.widthAnchor.constraint(equalTo: middleContainerView.widthAnchor).isActive = true
        
            //Stack views subViews
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.frame = CGRect(origin: .zero, size: CGSize(width: 84, height: 125))

        ratingView.translatesAutoresizingMaskIntoConstraints = false
        ratingView.frame = CGRect(origin: .zero, size: CGSize(width: 84, height: 125))
        
        dataView.translatesAutoresizingMaskIntoConstraints = false
        dataView.frame = CGRect(origin: .zero, size: CGSize(width: 82, height: 125))

        linkView.translatesAutoresizingMaskIntoConstraints = false
        linkView.frame = CGRect(origin: .zero, size: CGSize(width: 82, height: 125))
        
                //Views subviews
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.heightAnchor.constraint(equalTo: nameView.heightAnchor).isActive = true
        nameStackView.widthAnchor.constraint(equalTo: nameView.widthAnchor).isActive = true
        
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        ratingStackView.heightAnchor.constraint(equalTo: ratingView.heightAnchor).isActive = true
        ratingStackView.widthAnchor.constraint(equalTo: ratingView.widthAnchor).isActive = true
        
        dataStackView.translatesAutoresizingMaskIntoConstraints = false
        dataStackView.heightAnchor.constraint(equalTo: dataView.heightAnchor).isActive = true
        dataStackView.widthAnchor.constraint(equalTo: dataView.widthAnchor).isActive = true
        
        linkStackView.translatesAutoresizingMaskIntoConstraints = false
        linkStackView.heightAnchor.constraint(equalTo: linkView.heightAnchor).isActive = true
        linkStackView.widthAnchor.constraint(equalTo: linkView.widthAnchor).isActive = true
        
        
        //Bottom view's subViews
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: botContainerView.topAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: botContainerView.widthAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        descriptionTextView.widthAnchor.constraint(equalTo: botContainerView.widthAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: botContainerView.bottomAnchor).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .customeWhite
        
        
        //Top view's subViews
        posterView.backgroundColor = .customGray
        
        posterImageView.backgroundColor = .clear
        posterImageView.image = UIImage(named: "Image3")
        posterImageView.contentMode = .scaleAspectFill
        
        
        //Middle view's subViews
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 45
        horizontalStackView.distribution = .fillProportionally
        
        firstverticalStackView.axis = .vertical
        firstverticalStackView.spacing = 32
        firstverticalStackView.distribution = .fillProportionally
        
        secondverticalStackView.axis = .vertical
        secondverticalStackView.spacing = 32
        secondverticalStackView.distribution = .fillProportionally
        
        nameStackView.axis = .vertical
        ratingStackView.axis = .vertical
        dataStackView.axis = .vertical
        linkStackView.axis = .vertical
        
            //nameStackView's subViews
        nameLabel.setStandatrtLabelTextAttrs(with: "Name")
        nameValueLabel.setStandatrtLabelTextAttrs(with: "-")
        nameChangeButton.setChangeButtonAttrs(with: #selector(nameChangeButtonTapped))
        
            //ratingStackView's subViews
        ratingLabel.setStandatrtLabelTextAttrs(with: "Your Rating")
        ratingValueLabel.setStandatrtLabelTextAttrs(with: "-")
        ratingChangeButton.setChangeButtonAttrs(with: #selector(ratingChangeButtonTapped))
            
            //dataStackView's subViews
        dataLabel.setStandatrtLabelTextAttrs(with: "Release Date")
        dataValueLabel.setStandatrtLabelTextAttrs(with: "-")
        dataChangeButton.setChangeButtonAttrs(with: #selector(dataChangeButtonTapped))
            
            //linkStackView's subViews
        linkLabel.setStandatrtLabelTextAttrs(with: "YouTube Link")
        linkValueLabel.setStandatrtLabelTextAttrs(with: "-")
        linkChangeButton.setChangeButtonAttrs(with: #selector(linkChangeButtonTapped))

        
        //Bottom view's subViews
        descriptionLabel.setStandatrtLabelTextAttrs(with: "Description")
        
        descriptionTextView.font = .manrope(ofSize: 14, style: .regular)
        descriptionTextView.textColor = .fontBlack
        descriptionTextView.isEditable = true
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        descriptionTextView.allowsEditingTextAttributes = true
    }
    
    
    
//MARK: - Actions
    
    @objc private func nameChangeButtonTapped() {
        
    }
    
    @objc private func ratingChangeButtonTapped() {
        
    }
    
    @objc private func dataChangeButtonTapped() {
        
    }
    
    @objc private func linkChangeButtonTapped() {
        
    }
    
    
    
    private func setCornerRadius() {
        
        posterView.layer.cornerRadius = posterView.frame.height / 2
        posterView.clipsToBounds = true
    }
}
 


    //MARK: - Extention Extention for MainScreenViewController with protocol MainScreenView

