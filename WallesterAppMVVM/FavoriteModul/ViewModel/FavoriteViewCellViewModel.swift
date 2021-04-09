//
//  FavoriteViewCellViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

class FavoruteViewCellViewModel: FavoriteCellViewModelProtocol {
    private var beer: String
    
    var valueOfBeer: String {
        return beer
    }
    
    init(beer: String) {
        self.beer = beer
    }
}
