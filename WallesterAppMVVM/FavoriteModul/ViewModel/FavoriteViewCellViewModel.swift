//
//  FavoriteViewCellViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

class FavoruteViewCellViewModel: FavoriteCellViewModelProtocol {
    private var beer: Beer
    
    var nameOfBeer: String {
        return beer.name
    }
    
    var volOfBeer: String {
        return String(beer.abv)
    }
    
    var ebc: String {
        return String(beer.ebc ?? 0)
    }
    
    var ibu: String {
        return String(beer.ibu ?? 0)
    }
    
    init(beer: Beer) {
        self.beer = beer
    }
}
