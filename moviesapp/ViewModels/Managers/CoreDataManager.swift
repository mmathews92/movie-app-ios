//
//  CoreDataManager.swift
//  moviesapp
//
//  Created by Michael Mathews on 10/04/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "moviesapp")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
    
    func getAllMovies() -> [MovieEntity] {
        let request: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func save(){
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
}
