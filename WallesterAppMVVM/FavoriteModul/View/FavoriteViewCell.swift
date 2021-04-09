//
//  FavoriteViewCell.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import UIKit

class FavoriteViewCell: UITableViewCell {
    
    var valueOfBeer = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        configureStackView()
//        configureNabeOfBeer()
//        configureVolOfBeer()
        addSubview(valueOfBeer)
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
            valueOfBeer.text = viewModel.valueOfBeer
            //volOfBeer.text = viewModel.volOfBeer
            
        }
    }
    func configureNabeOfBeer() {
        valueOfBeer.numberOfLines = 0
        valueOfBeer.adjustsFontSizeToFitWidth = true
        
    }
    func setNameOfBeerConstraints() {
        valueOfBeer.translatesAutoresizingMaskIntoConstraints = false
        valueOfBeer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        valueOfBeer.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
