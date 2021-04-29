//
//  DetailViewCellViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

class DetailViewCellViewModel: DetailViewCellViewModelProtocol {
    var beer: Beer
    var indexPath: IndexPath
    
    var nameOfBeer: String {

        switch indexPath.row {
        case 0:
            return "Name: \(beer.name)"
        case 1:
            return "Alcohol: \(beer.abv)"
        case 2:
            return "EBC: \(beer.ebc ?? 0)"
        case 3:
            return "IBU: \(beer.ibu ?? 0)"
        default:
            return "nil"
        }
    }
    
    init(beer: Beer, indexPath: IndexPath) {
        self.beer = beer
        self.indexPath = indexPath
    }
    
    
}
