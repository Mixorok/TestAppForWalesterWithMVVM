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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureStackView()
        configureNabeOfBeer()
        configureVolOfBeer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    weak var viewModel: MainCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            nameOfBeer.text = viewModel.nameOfBeer
            volOfBeer.text = viewModel.volOfBeer
            
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
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
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
