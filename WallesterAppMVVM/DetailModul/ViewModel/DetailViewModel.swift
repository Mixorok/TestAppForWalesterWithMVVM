//
//  DetailViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation
import UIKit

class DetailViewModel: DetailViewModelProtocol{
    var beer: Beer
    var coreDataService: CoreDataProtocol
    
    var label: String {
        return beer.name
    }
    
    func numberOfRows() -> Int {
        return 4
    }
    
    func ifIsFavorite() -> Bool {
        return beer.favorite ?? false
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailViewCellViewModelProtocol? {
        return DetailViewCellViewModel(beer: beer, indexPath: indexPath)
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
