//
//  CoreData.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation
import UIKit
import CoreData

protocol CoreDataProtocol {
    func loadData(completion: @escaping (Result<[FavoriteBeers], Error>) -> ())
//    func saveData(_ beer: Beer)
//    func loadData() -> [FavoriteBeers]
//    func deleteData(_ beer: Beer)
}

class CoreDataService: CoreDataProtocol {
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request: NSFetchRequest<FavoriteBeers> = FavoriteBeers.fetchRequest()
    
    
    func saveData(_ beer: Beer) {
        let favoriteBeers = FavoriteBeers(context: context)
        favoriteBeers.name = beer.name
        favoriteBeers.abv = beer.abv
        favoriteBeers.ebc = beer.ebc ?? 0
        favoriteBeers.ibu = beer.ibu ?? 0
        favoriteBeers.favorite = beer.favorite!
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    func loadData(completion: @escaping (Result<[FavoriteBeers], Error>) -> ()){
        do {
            let obj = try context.fetch(request)
            completion(.success(obj))
        } catch  {
            completion(.failure(error))
        }
    }
    
//    func loadData() -> [FavoriteBeers] {
//        var favoriteBeers = [FavoriteBeers]()
//        do {
//            favoriteBeers = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
//        return favoriteBeers
//    }
    
    func deleteData(_ beer: Beer) {
        request.predicate = NSPredicate(format: "name = %@", beer.name)
        do {
            let obj = try context.fetch(request)
            let objectToDelete = obj[0]
            context.delete(objectToDelete)
            do {
                try context.save()
            } catch  {
                print("Error saving data in DeleteData \(error)")
            }
        } catch  {
            print("Error deleting data in DeleteData \(error)")
        }
    }
}


