//
//  ViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation


class ViewModel: MainViewViewModelProtocol {
    
    private var selectedIndexPath: IndexPath?
    
    
    var beers = [Beer(name: "Test", abv: 20, ebc: 30, ibu: 40, favorite: true),
                 Beer(name: "Test2", abv: 39, ebc: 40, ibu: 60, favorite: true),
                 Beer(name: "Test3", abv: 50, ebc: 55, ibu: 70, favorite: true)]
    
    
    func numberOfRows() -> Int {
        return beers.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MainCellViewModelProtocol? {
        let beer = beers[indexPath.row]
        return MainViewCellViewModel(beer: beer)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil}
        return DetailViewModel(beer: beers[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
}
