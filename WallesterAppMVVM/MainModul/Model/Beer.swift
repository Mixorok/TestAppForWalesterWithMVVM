//
//  Beer.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation

struct Beer: Decodable {
    let name: String
    let abv: Double
    let ebc: Double?
    let ibu: Double?
    var favorite: Bool?
    
    init(name: String, abv: Double, ebc: Double? = nil, ibu: Double? = nil, favorite: Bool = false) {
        self.name = name
        self.abv = abv
        self.ebc = ebc
        self.ibu = ibu
        self.favorite = favorite
    }
}

