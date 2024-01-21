import UIKit

//MARK: - Final class MainScreenTableViewCell

final class MainScreenTableViewCell: UITableViewCell {
    
    
    //MARK: - Properties
    
    let containerView = UIView()
    let moviePosterImageView = UIImageView()
    let infoView = UIView()
    
    
    
    
    //MARK: - Initializators
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(containerView)
        containerView.addSubViews(with: moviePosterImageView, infoView)
        
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
    }
    
    
    
    //MARK: - Configurations of User Interface
    
    private func configureUI() {
        
        contentView.backgroundColor = .clear
        
        containerView.backgroundColor = .customeWhite
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
        
        moviePosterImageView.backgroundColor = .lightGray
        
        infoView.backgroundColor = .clear
        infoView.layer.shadowColor = UIColor.black.cgColor
        infoView.layer.shadowOffset = CGSize(width: 5, height: 5)
        infoView.layer.shadowOpacity = 50
        infoView.layer.shadowRadius = 10
    }
}
