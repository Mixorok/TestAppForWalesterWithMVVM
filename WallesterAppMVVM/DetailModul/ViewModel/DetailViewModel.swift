//
//  DetailViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation
import UIKit

class DetailViewModel: DetailViewModelProtocol{
    private var beers: Beer
    
    var label: String {
        return beers.name
    }
    
    func numberOfRows() -> Int {
        return 4
    }
    
    func ifIsFavorite(button: UIBarButtonItem) -> UIBarButtonItem {
        if beers.favorite == true {
            button.tintColor = UIColor.yellow
            return button
        } else {
            button.tintColor = UIColor.gray
            print(beers)
            return button
        }
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailViewCellViewModelProtocol? {
        return DetailViewCellViewModel(beer: beers, indexPath: indexPath)
    }
    
    init(beer: Beer) {
        self.beers = beer
    }
    
    
}
