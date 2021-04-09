//
//  FavoriteViewCell.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import UIKit

class FavoriteViewCell: UITableViewCell {
    
    var nameOfBeer = UILabel()
    var volOfBeer = UILabel()
    var ebc = UILabel()
    var ibu = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        configureStackView()
//        configureNabeOfBeer()
//        configureVolOfBeer()
        addSubview(nameOfBeer)
        setNameOfBeerConstraints()
        configureNabeOfBeer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var viewModel: FavoriteCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            nameOfBeer.text = viewModel.nameOfBeer
            volOfBeer.text = viewModel.volOfBeer
            
        }
    }
    func configureNabeOfBeer() {
        nameOfBeer.numberOfLines = 0
        nameOfBeer.adjustsFontSizeToFitWidth = true
        
    }
    func setNameOfBeerConstraints() {
        nameOfBeer.translatesAutoresizingMaskIntoConstraints = false
        nameOfBeer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameOfBeer.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
