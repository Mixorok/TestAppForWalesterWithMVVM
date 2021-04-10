//
//  MainTableViewCell.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import UIKit

class MainViewCell: UITableViewCell {

    var nameOfBeer = UILabel()
    var volOfBeer = UILabel()
    let stackView = UIStackView()
    let starButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureStackView()
        configureNabeOfBeer()
        configureVolOfBeer()
        configureFavoriteStarButton ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var viewModel: MainCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            nameOfBeer.text = viewModel.nameOfBeer
            volOfBeer.text = viewModel.volOfBeer
            ifFavoriteBeer(viewModel: viewModel)
            
        }
    }
    
    func configureFavoriteStarButton () {
        starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starButton.tintColor = .gray
        starButton.addTarget(self, action: #selector(addToFavoriteByButtonPressed), for: .touchUpInside)
        accessoryView = starButton
    }
    
    func ifFavoriteBeer (viewModel: MainCellViewModelProtocol) {
        if viewModel.isFavorite == true {
            self.starButton.tintColor = .yellow
        } else {
            self.starButton.tintColor = .gray
        }
    }
    
    @objc private func addToFavoriteByButtonPressed() {
        //view?.addToFavorite(cell: self)
        if starButton.tintColor == UIColor.yellow {
            starButton.tintColor = UIColor.gray
            viewModel?.beer.favorite = false
            viewModel?.deleteInCoreData()
        } else {
            starButton.tintColor = UIColor.yellow
            viewModel?.beer.favorite = true
            viewModel?.saveInCoreData()
        }
    }
    
    //MARK: - All Configurations
    
    func configureStackView(){
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.addArrangedSubview(nameOfBeer)
        stackView.addArrangedSubview(volOfBeer)
        //constraint
        setStackViewConstraint()
    }
    func setStackViewConstraint () {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    }
    
    func configureNabeOfBeer() {
        nameOfBeer.numberOfLines = 0
        nameOfBeer.adjustsFontSizeToFitWidth = true
    }
    
    func configureVolOfBeer() {
        volOfBeer.numberOfLines = 0
        volOfBeer.adjustsFontSizeToFitWidth = true
        volOfBeer.font = textLabel?.font.withSize(13)
    }
    
   

}
