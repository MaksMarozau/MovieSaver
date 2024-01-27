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
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
        viewWillStart()
        
        testCell()
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainScreenTableViewCell", for: indexPath) as? MainScreenTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.addContent(imageName: movie.imageName, movieName: movie.name, ratingScore: movie.rating)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        presenter.tableViewsCellTapped(with: movie)
        
    }
    
    
    
    private func testCell() {
        
        let film = Movie(name: "Spider-Man: No Way Home", rating: "9.3", releaseData: "22.08.2023", imageName: "", youTubeLink: "link", description: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man. With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man. With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.")
        
        movies.append(film)
        tableView.reloadData()
    }
}



//MARK: - Extention Extention for MainScreenView with protocol MainScreenViewInputProtocol

extension MainScreenView: MainScreenViewInputProtocol {
    
    func updateData(_ moviesDataArray: [Movie]) {
        
        movies = moviesDataArray
        tableView.reloadData()
    }
}
