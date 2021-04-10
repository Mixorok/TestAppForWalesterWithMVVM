//
//  ViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation


class ViewModel: MainViewViewModelProtocol {
    
    
    private var selectedIndexPath: IndexPath?
    var coreDataService: CoreDataProtocol!
    var networkService: NetworkServiceProtocol!
    var beers: [Beer]?
//    var beers: [Beer]? = [Beer(name: "Test1", abv: 20, ebc: 20, ibu: 20, favorite: true),
//                 Beer(name: "TestFalse", abv: 20, ebc: 20, ibu: 20, favorite: false)]
    
    
    func numberOfRows() -> Int {
        return beers?.count ?? 0
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> MainCellViewModelProtocol? {
        guard var beer = beers?[indexPath.row] else {
            return nil
        }
        if coreDataService.checkData(beer) == true{
            beer.favorite = true
            //print(beer)
            return MainViewCellViewModel(beer: beer, coreDataService: coreDataService)
        } else {
            beer.favorite = false
            return MainViewCellViewModel(beer: beer, coreDataService: coreDataService)
        }
        
    }
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil}
        guard var beer = beers?[selectedIndexPath.row] else {return nil}
        if coreDataService.checkData(beer) == true {
            beer.favorite = true
            return DetailViewModel(beer: beer)
        } else {
            beer.favorite = false
            return DetailViewModel(beer: beer)
        }
        //return DetailViewModel(beer: beers![selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func getBeers(completion: @escaping() -> ()) {
        networkService.getBeers { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let beers):
                    //self.beers = beers
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
