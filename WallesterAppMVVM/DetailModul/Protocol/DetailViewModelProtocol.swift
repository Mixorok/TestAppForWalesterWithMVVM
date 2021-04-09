//
//  DetailViewModelProtocol.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

protocol DetailViewModelProtocol {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailViewCellViewModelProtocol?
    var label: String {get}
    
}
