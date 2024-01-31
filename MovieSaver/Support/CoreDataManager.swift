import Foundation
import UIKit
import CoreData


//MARK: - Final class CoreDataManager

final class CoreDataManager {
    
    
//MARK: - Singleton of class
    
    static let instance = CoreDataManager(); private init() { }
    
    
    
//MARK: - SaveMovie method
    
    func saveMovie(name: String, rating: String, release: String, link: String, image: UIImage, description: String) -> Result <Void, CoreDataError> {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return .failure(.appDelegateError) }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext) else { return .failure(.entityError)}
        
        let movie = NSManagedObject(entity: entity, insertInto: managedContext)
        
        let imageData = image.jpegData(compressionQuality: 1)
        
        movie.setValue(name, forKey: "name")
        movie.setValue(rating, forKey: "rating")
        movie.setValue(release, forKey: "releaseDate")
        movie.setValue(link, forKey: "link")
        movie.setValue(imageData, forKey: "imageData")
        movie.setValue(description, forKey: "descript")
        
        do {
            try managedContext.save()
        } catch {
            return .failure(.saveError)
        }
        
        return .success(())
    }
    
    
    
//MARK: - LoadMovies method
    
    func loadMovies() -> Result <[Movie], CoreDataError> {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return .failure(.appDelegateError)}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let feetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        
        var movies: [Movie]
        
        do {
            let objects = try managedContext.fetch(feetchRequest)
            guard let feetchedMovies = objects as? [Movie] else { return .failure(.castError)}
            movies = feetchedMovies
        } catch {
            return .failure(.loadError)
        }
        return .success(movies)
    }
}
