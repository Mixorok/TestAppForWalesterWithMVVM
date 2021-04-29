//
//  ModelBuilder.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createFavoriteModule() -> UIViewController
    static func createDetailModule(detailVC: DetailViewController) -> UIViewController
}

class ModulBuilder: Builder {
    
    let networkService = NetworkService()
    let coreDataService = CoreDataService()
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let coreDataService = CoreDataService()
        view.viewModel = MainViewModel(networkService: networkService, coreDataService: coreDataService)
        return view
    }
    
    static func createFavoriteModule() -> UIViewController {
        let view = FavoriteViewController()
        let coreDataService = CoreDataService()
        view.viewModel = FavoriteViewModel(coreData: coreDataService)
        return view
    }
    
    static func createDetailModule(detailVC: DetailViewController) -> UIViewController {
        let view = detailVC
        return view
    }
    
}
