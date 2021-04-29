//
//  TableViewCellViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation

class MainViewCellViewModel: MainCellViewModelProtocol {
    
    var coreDataService: CoreDataProtocol
    var beer: Beer
    
    var nameOfBeer: String {
        return beer.name
    }
    
    var volOfBeer: String {
        return "Vol: \(String(beer.abv))"
    }
    
    var isFavorite: Bool? {
        return beer.favorite
    }
    
    func deleteInCoreData() {
        coreDataService.deleteData(beer)
    }
    
    func saveInCoreData() {
        coreDataService.saveData(beer)
    }

    init(beer: Beer, coreDataService: CoreDataProtocol) {
        self.beer = beer
        self.coreDataService = coreDataService
    }

}
