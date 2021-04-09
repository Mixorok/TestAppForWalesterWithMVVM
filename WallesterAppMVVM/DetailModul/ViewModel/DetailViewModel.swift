//
//  DetailViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

class DetailViewModel: DetailViewModelProtocol{
    private var beers: Beer
    
    var label: String {
        return beers.name
    }
    
    func numberOfRows() -> Int {
        return 4
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailViewCellViewModelProtocol? {
        return DetailViewCellViewModel(beer: beers, indexPath: indexPath)
    }
    
    init(beer: Beer) {
        self.beers = beer
    }
    
    
}
