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
    func saveData(_ beer: Beer)
    func deleteData(_ beer: Beer)
    func checkData(_ beer: Beer) -> Bool
}

struct CoreDataService: CoreDataProtocol {
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request: NSFetchRequest<FavoriteBeers> = FavoriteBeers.fetchRequest()
    
    func saveData(_ beer: Beer) {
        let favoriteBeers = FavoriteBeers(context: context)
        favoriteBeers.name = beer.name
        favoriteBeers.abv = beer.abv
        favoriteBeers.ebc = beer.ebc ?? 0
        favoriteBeers.ibu = beer.ibu ?? 0
        favoriteBeers.favorite = beer.favorite ?? false
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
    
    func checkData(_ beer: Beer) -> Bool {
        request.predicate = NSPredicate(format: "name = %@", beer.name)
        var obj = [FavoriteBeers]()
        do {
            obj = try context.fetch(request)
        } catch  {
            print("Error deleting data in DeleteData \(error)")
        }
        if obj.count > 0{
            return true
        } else {
            return false
        }
    }
}


