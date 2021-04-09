//
//  FavoriteCellViewModelProtocol.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

protocol FavoriteCellViewModelProtocol: class {
    var nameOfBeer: String {get}
    var volOfBeer: String {get}
    var ebc: String {get}
    var ibu: String {get}
}
