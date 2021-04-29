//
//  TableViewViewModelType.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation

protocol MainViewViewModelProtocol {
    init(networkService: NetworkServiceProtocol, coreDataService: CoreDataProtocol) 
    
    func getBeers(completion: @escaping () -> Void)
    
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MainCellViewModelProtocol?
    
    func viewModelForSelectedRow(atIndexPath indexPath: IndexPath) -> DetailViewModelProtocol?
}
