import UIKit

//MARK: - Protocol for extention MainScreenView with MVP-archetecture's methods

protocol MainScreenViewInputProtocol: AnyObject {
    
    func updateData(_ moviesDataArray: [Movie])
}



//MARK: - Final class MainScreenView

final class MainScreenView: UIViewController {

    
//MARK: - Properties of class
    
    var presenter: MainScreenPresenterProtocol!
    
    private let tableView = UITableView()
    
    private var movies: [Movie] = []
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MainScreenTableViewCell.self, forCellReuseIdentifier: "MainScreenTableViewCell")
        
        view.addSubview(tableView)

        setConstraintes()
        configureUI()
        
        Notification.greeting.getDescriptionAbout()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
        viewWillStart()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { [weak self]_ in
            self?.presenter.addButtonTapped()
        }))
        navigationItem.title = "My Movie List"
    }
    

    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundMain
        
        tableView.backgroundColor = .clear
        tableView.rowHeight = 217
        tableView.separatorStyle = .none
    }
  
    
    
//MARK: - Works out before view will start
    
    private func viewWillStart() {
        presenter.loadData()
    }
}



//MARK: - Extention for MainScreenView with protocols UITableView

extension MainScreenView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        let imageData = movie.imageData
        let name = movie.name
        let rating = movie.rating
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainScreenTableViewCell", for: indexPath) as? MainScreenTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        if let imageData, let name, let rating {
            let image = UIImage(data: imageData)
            cell.addContent(image: image, movieName: name, ratingScore: rating)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        presenter.tableViewsCellTapped(with: movie)
    }
}



//MARK: - Extention Extention for MainScreenView with protocol MainScreenViewInputProtocol

extension MainScreenView: MainScreenViewInputProtocol {
    
    func updateData(_ moviesDataArray: [Movie]) {
        
        movies = moviesDataArray
        tableView.reloadData()
    }
}
