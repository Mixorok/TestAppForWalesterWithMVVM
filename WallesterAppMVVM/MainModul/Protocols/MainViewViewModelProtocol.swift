//
//  TableViewViewModelType.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation

protocol MainViewViewModelProtocol {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MainCellViewModelProtocol?
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol?
    func selectRow(atIndexPath indexPath: IndexPath)
}
