//
//  TableViewCellViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation

protocol MainCellViewModelProtocol: class {
    var beer: Beer {get set}
    var nameOfBeer: String {get}
    var volOfBeer: String {get}
    var isFavorite: Bool? {get}
    
    func saveInCoreData()
    func deleteInCoreData()
    //var favorite: Box<Bool?> {get}
}
