//
//  DetailViewModelProtocol.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation
import UIKit

protocol DetailViewModelProtocol {
    var beer: Beer {get set}
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DetailViewCellViewModelProtocol?
    var label: String {get}
    
    func ifIsFavorite() -> Bool
    
    func saveInCoreData()
    func deleteInCoreData()
    
}
