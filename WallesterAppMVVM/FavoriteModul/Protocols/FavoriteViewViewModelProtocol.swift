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
    
    init (coreData: CoreDataProtocol)
    func loadData(completion: @escaping () -> Void)
    
    func selectedSegment(targetIndex: Int)
    var segmentItems: [String] {get}
    
    func viewModelForSelectedRow(atIndexPath indexPath: IndexPath) -> DetailViewModelProtocol?
}
