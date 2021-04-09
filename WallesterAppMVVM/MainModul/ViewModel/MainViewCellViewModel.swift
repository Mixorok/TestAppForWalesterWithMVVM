//
//  TableViewCellViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation

class MainViewCellViewModel: MainCellViewModelProtocol {
    private var beer: Beer
    
    var nameOfBeer: String {
        return beer.name
    }
    
    var volOfBeer: String {
        return "Vol: \(String(beer.abv))"
    }
    
    var isFavorite: Bool? {
        return beer.favorite
    }

    init(beer: Beer) {
        self.beer = beer
    }

}
