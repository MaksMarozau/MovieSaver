import UIKit
import WebKit

//MARK: - Protocol for extention DetailInfoView with MVP-archetecture's methods

protocol DetailInfoViewInputProtocol: AnyObject {
    func showTrailer(by url: URL)
    func getData(with name: String, _ rating: String, _ relieaseDate: String, _ description: String, _ link: String)
}



//MARK: - Final class DetailInfoView

class DetailInfoView: UIViewController {
    
    
//MARK: - Properties of class
    
    var presenter: DetailInfoPresenterProtocol!
    
    private let posterImageView = UIImageView()
    private let containerView = UIView()
    
    private let titleLabel = UILabel()
    private let subTitleView = UIView()
    private let descriptionView = UIView()
    private let trailerView = UIView()
    
    private let starImageView = UIImageView()
    private let ratingLabel = UILabel()
    private let dateLabel = UILabel()
    
    private let descriptionScrollView = UIScrollView()
    private let descriptionLabel = UILabel()
    
    private let trailerLinkButton = UIButton()
    private let trailerWebKiView = WKWebView()
    
    
    private var link = ""
        
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViwes()
        setConstraintes()
        configureUI()
        
        presenter.loadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
//MARK: - Add subViews
    
    private func addSubViwes() {
        
        view.addSubViews(with: posterImageView, containerView)
        
        containerView.addSubViews(with: titleLabel, subTitleView, descriptionView, trailerView)
        
        subTitleView.addSubViews(with: starImageView, ratingLabel, dateLabel)
        descriptionView.addSubview(descriptionScrollView)
        trailerView.addSubViews(with: trailerLinkButton, trailerWebKiView)
        
        descriptionScrollView.addSubview(descriptionLabel)
    }
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        //View's subViews
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        posterImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: 296).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: -39).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        //ContainerView's subViews
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 29).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 19).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -19).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        subTitleView.translatesAutoresizingMaskIntoConstraints = false
        subTitleView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14).isActive = true
        subTitleView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 19).isActive = true
        subTitleView.widthAnchor.constraint(equalToConstant: 124).isActive = true
        subTitleView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: subTitleView.bottomAnchor, constant: 13).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 19).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -19).isActive = true
        descriptionView.heightAnchor.constraint(equalToConstant: 138).isActive = true
        
        trailerView.translatesAutoresizingMaskIntoConstraints = false
        trailerView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 24).isActive = true
        trailerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 19).isActive = true
        trailerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -19).isActive = true
        trailerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -52).isActive = true
        
        
        //SubTitleView's subViews
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.centerYAnchor.constraint(equalTo: subTitleView.centerYAnchor).isActive = true
        starImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        starImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: subTitleView.leadingAnchor).isActive = true
        
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.centerYAnchor.constraint(equalTo: subTitleView.centerYAnchor).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 49).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 11).isActive = true
        
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerYAnchor.constraint(equalTo: subTitleView.centerYAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 49).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 6).isActive = true
        
        
        //DescriptionView's subView
        descriptionScrollView.translatesAutoresizingMaskIntoConstraints = false
        descriptionScrollView.topAnchor.constraint(equalTo: descriptionView.topAnchor).isActive = true
        descriptionScrollView.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        descriptionScrollView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        descriptionScrollView.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true

        
        //TrailerView's subViews
        trailerLinkButton.translatesAutoresizingMaskIntoConstraints = false
        trailerLinkButton.centerXAnchor.constraint(equalTo: trailerView.centerXAnchor).isActive = true
        trailerLinkButton.centerYAnchor.constraint(equalTo: trailerView.centerYAnchor).isActive = true
        trailerLinkButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        trailerLinkButton.widthAnchor.constraint(equalToConstant: 177).isActive = true
        
        trailerWebKiView.translatesAutoresizingMaskIntoConstraints = false
        trailerWebKiView.heightAnchor.constraint(equalTo: trailerView.heightAnchor).isActive = true
        trailerWebKiView.widthAnchor.constraint(equalTo: trailerView.widthAnchor).isActive = true
        trailerWebKiView.isHidden = true
        
        
        //DescriptionScrollView's subView
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: descriptionScrollView.topAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: descriptionScrollView.widthAnchor, multiplier: 1).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: descriptionScrollView.bottomAnchor).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        //View
        view.backgroundColor = .customeWhite
        
        //View's subViews
        posterImageView.backgroundColor = .customGray
        
        containerView.backgroundColor = .customeWhite
        containerView.layer.cornerRadius = 16
        
        titleLabel.textColor = .fontBlack
        titleLabel.font = .manrope(ofSize: 24, style: .bold)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
               
        trailerView.backgroundColor = .brown

        
        //ContainerView's subViews
        starImageView.image = UIImage(systemName: "star.fill")
        starImageView.tintColor = .customYellow
        
        ratingLabel.font = .manrope(ofSize: 14, style: .regular)
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .fontSemyBlack
        ratingLabel.attributedText = setAttributedText(with: "6.0/10")
        
        dateLabel.font = .manrope(ofSize: 14, style: .regular)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .fontLiteGray
        dateLabel.text = "2023"
        
        
        //TrailerView's subViews
        trailerLinkButton.setTitle("YouTube trailer", for: .normal)
        trailerLinkButton.setTitleColor(.fontBlack, for: .normal)
        trailerLinkButton.titleLabel?.font = .manrope(ofSize: 15, style: .semiBold)
        trailerLinkButton.titleLabel?.textAlignment = .center
        trailerLinkButton.addTarget(self, action: #selector(trailerLinkTapped), for: .touchUpInside)
        
        trailerWebKiView.allowsBackForwardNavigationGestures = true
        
        
        //DescriptionScrollView's subView
        descriptionLabel.textColor = .fontBlack
        descriptionLabel.font = .manrope(ofSize: 14, style: .regular)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man."
    }
    
    
    
//MARK: - Actions
    
    @objc private func trailerLinkTapped() {
        
        presenter.linkTapped(link: link)
    }
    
    
    
//MARK: - Attributed text
        
    private func setAttributedText(with text: String?) -> NSAttributedString? {
        
        guard let text = text, text.count == 6 else { return nil }
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: 3)
        
        attributedText.addAttribute(.font, value: UIFont.manrope(ofSize: 14, style: .bold), range: range)
        return attributedText
    }
}


      
//MARK: - Extention Extention for DetailInfoView with protocol DetailInfoViewInputProtocol

extension DetailInfoView: DetailInfoViewInputProtocol {
    
    func getData(with name: String, _ rating: String, _ relieaseDate: String, _ description: String, _ link: String) {
        
        titleLabel.text = name
        ratingLabel.text = rating
        dateLabel.text = relieaseDate
        descriptionLabel.text = description
        self.link = link
    }
    
    
    func showTrailer(by url: URL) {
        
        trailerWebKiView.load(URLRequest(url: url))
        trailerWebKiView.isHidden = false
    }
}
