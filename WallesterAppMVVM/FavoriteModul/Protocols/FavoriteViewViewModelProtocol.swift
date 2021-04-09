//
//  FavoriteViewViewModelProtocol.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

protocol FavoriteViewViewModelProtocol {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> FavoriteCellViewModelProtocol?
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol?
    func selectRow(atIndexPath indexPath: IndexPath)
}
