//
//  FavoriteViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

class FavoriteViewModel: FavoriteViewViewModelProtocol {

    
    private var selectedIndexPath: IndexPath?
    
    var beers = [Beer(name: "FavTest", abv: 20, ebc: 30, ibu: 40, favorite: true),
                 Beer(name: "FavTest2", abv: 39, ebc: 40, ibu: 60, favorite: true),
                 Beer(name: "FavTest3", abv: 50, ebc: 55, ibu: 70, favorite: true)]
    
    func numberOfRows() -> Int {
        beers.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> FavoriteCellViewModelProtocol? {
        let beer = beers[indexPath.row]
        return FavoruteViewCellViewModel(beer: beer)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil}
        return DetailViewModel(beer: beers[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
