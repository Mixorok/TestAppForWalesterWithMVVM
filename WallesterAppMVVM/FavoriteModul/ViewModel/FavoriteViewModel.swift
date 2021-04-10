//
//  FavoriteViewModel.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

class FavoriteViewModel: FavoriteViewViewModelProtocol {
    
    
    
    var coreData: CoreDataProtocol
    var segmentItems: [String] = ["Name", "Alcohol", "EBC", "IBU"]
    var beers = [FavoriteBeers]()
    
    private var segmentTargetIndex = 0
    private var selectedIndexPath: IndexPath?
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> FavoriteCellViewModelProtocol? {
        switch segmentTargetIndex {
        case 0:
            let beer = beers[indexPath.row].name
            return FavoruteViewCellViewModel(beer: beer!)
        case 1:
            let beer = String(beers[indexPath.row].abv)
            return FavoruteViewCellViewModel(beer: beer)
        case 2:
            let beer = String(beers[indexPath.row].ebc)
            return FavoruteViewCellViewModel(beer: beer)
        case 3:
            let beer = String(beers[indexPath.row].ibu)
            return FavoruteViewCellViewModel(beer: beer)
        default:
            return nil
        }
        
    }
    
    func numberOfRows() -> Int {
        beers.count
    }
    
    func selectedSegment(targetIndex: Int) {
        switch targetIndex {
        case 0:
            segmentTargetIndex = 0
            beers = beers.sorted{$0.name ?? ""<$1.name ?? ""}
        case 1:
            segmentTargetIndex = 1
            beers = beers.sorted{$0.abv<$1.abv}
        case 2:
            segmentTargetIndex = 2
            beers = beers.sorted{$0.ebc<$1.ebc }
        case 3:
            segmentTargetIndex = 3
            beers = beers.sorted{$0.ibu<$1.ibu }
        default:
            break
        }
    }
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil}
        //guard let selectedBeers = beers?[selectedIndexPath.row] else {return nil}
        let selectedBeer = beers[selectedIndexPath.row]
        return DetailViewModel(beer: Beer(name: selectedBeer.name ?? "NoBeers", abv: selectedBeer.abv, ebc: selectedBeer.ebc, ibu: selectedBeer.ibu, favorite: selectedBeer.favorite))
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    required init(coreData: CoreDataProtocol) {
        self.coreData = coreData
        
    }
    
    func loadData(completion: @escaping () -> Void) {
        coreData.loadData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favoriteBeers):
                switch self.segmentTargetIndex {
                case 0:
                    self.beers = favoriteBeers.sorted{$0.name ?? ""<$1.name ?? ""}
                case 1:
                    self.beers = favoriteBeers.sorted{$0.abv<$1.abv}
                case 2:
                    self.beers = favoriteBeers.sorted{$0.ebc<$1.ebc}
                case 3:
                    self.beers = favoriteBeers.sorted{$0.ibu<$1.ibu}
                default:
                    break
                }
                    //self.beers = favoriteBeers
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
