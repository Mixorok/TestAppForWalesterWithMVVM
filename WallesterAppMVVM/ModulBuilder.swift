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
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        view.viewModel = ViewModel(networkService: networkService)
        return view
    }
    
    static func createFavoriteModule() -> UIViewController {
        let view = FavoriteViewController()
        let coreData = CoreDataService()
        view.viewModel = FavoriteViewModel(coreData: coreData)
        return view
    }
    
    static func createDetailModule(detailVC: DetailViewController) -> UIViewController {
        let view = detailVC
        return view
    }
    
}
