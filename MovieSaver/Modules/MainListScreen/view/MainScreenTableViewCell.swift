import UIKit

//MARK: - Final class MainScreenTableViewCell

final class MainScreenTableViewCell: UITableViewCell {
    
    
//MARK: - Properties
    
    private let containerView = UIView()
    private let moviePosterImageView = UIImageView()
    private let infoView = UIView()
    
    private let scoreLabel = UILabel()
    private let nameLabel = UILabel()
    
    
    
//MARK: - Initializators
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(containerView)
        containerView.addSubViews(with: moviePosterImageView, infoView)
        infoView.addSubViews(with: scoreLabel, nameLabel)
        
        setConstraintes()
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        moviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
        moviePosterImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        moviePosterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        moviePosterImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        moviePosterImageView.widthAnchor.constraint(equalToConstant: 197).isActive = true
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        infoView.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor).isActive = true
        infoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        scoreLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -50).isActive = true
        scoreLabel.widthAnchor.constraint(equalToConstant: 79).isActive = true
        scoreLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 34).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 108).isActive = true
        nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 59).isActive = true
    }
    
    
    
//MARK: - Configurations of User Interface
    
    private func configureUI() {
        
        contentView.backgroundColor = .clear
        
        containerView.backgroundColor = .customeWhite
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 5, height: 5)
        containerView.layer.shadowOpacity = 50
        containerView.layer.shadowRadius = 10
        
        moviePosterImageView.backgroundColor = .lightGray
        
        infoView.backgroundColor = .clear
        
        scoreLabel.backgroundColor = .clear
        scoreLabel.textColor = .fontBlack
        scoreLabel.font = .manrope(ofSize: 18, style: .regular)
        scoreLabel.textAlignment = .center
        scoreLabel.numberOfLines = 1
        
        nameLabel.backgroundColor = .clear
        nameLabel.numberOfLines = 0
    }
    
    
    
//MARK: - Attributed text
    
    private func setAttributedText(with text: String?) -> NSAttributedString? {
        
        guard let text = text, text.count == 6 else { return nil }
        let attributedText = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: 3)
        
        attributedText.addAttribute(.font, value: UIFont.manrope(ofSize: 18, style: .bold), range: range)
        return attributedText
    }
    
    
    
//MARK: - Adding of content to cell (public method)
    
    func addContent(imageName: String, movieName: String, ratingScore: String) {
        
        moviePosterImageView.image = UIImage(named: imageName)
        nameLabel.setStandatrtLabelTextAttrs(with: movieName)
        scoreLabel.attributedText = setAttributedText(with: "\(ratingScore)/10")
    }
}
