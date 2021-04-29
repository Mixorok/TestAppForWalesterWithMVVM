//
//  ViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation


class MainViewModel: MainViewViewModelProtocol {
    
    var coreDataService: CoreDataProtocol!
    var networkService: NetworkServiceProtocol!
    var beers: [Beer]?
    
    
    func numberOfRows() -> Int {
        return beers?.count ?? 0
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MainCellViewModelProtocol? {
        guard var beer = beers?[indexPath.row] else {
            return nil
        }
        if coreDataService.checkData(beer) == true{
            beer.favorite = true
            return MainViewCellViewModel(beer: beer, coreDataService: coreDataService)
        } else {
            beer.favorite = false
            return MainViewCellViewModel(beer: beer, coreDataService: coreDataService)
        }
        
    }
    
    func viewModelForSelectedRow(atIndexPath indexPath: IndexPath) -> DetailViewModelProtocol? {
        guard var beer = beers?[indexPath.row] else {return nil}
        if coreDataService.checkData(beer) == true {
            beer.favorite = true
            return DetailViewModel(beer: beer, coreDataService: coreDataService)
        } else {
            beer.favorite = false
            return DetailViewModel(beer: beer, coreDataService: coreDataService)
        }
    }
    
    //This VAR for UNIT test
    var checkBeers = false
    
    func getBeers(completion: @escaping() -> ()) {
        networkService.getBeers { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let beers):
                    self.checkBeers = true
                    self.beers = beers!.sorted{ $0.name < $1.name }
                    completion()
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
    }
    
    required init(networkService: NetworkServiceProtocol, coreDataService: CoreDataProtocol) {
        self.networkService = networkService
        self.coreDataService = coreDataService
    }
    
}
