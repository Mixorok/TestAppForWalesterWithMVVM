//
//  DetailViewController.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import UIKit

class DetailViewController: UIViewController {
    var tableView = UITableView()
    var viewModel: DetailViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        customiseSections()
        configureNavBar()
        title = viewModel?.label
    }

    
    func configureNavBar() {
        let button = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(addToFavorite))

        button.tintColor = (viewModel?.ifIsFavorite())! ? UIColor.yellow : UIColor.gray
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func addToFavorite(sender:UIButton) {
        if viewModel?.ifIsFavorite() == true {
            sender.tintColor = UIColor.gray
            viewModel?.beer.favorite = false
            viewModel?.deleteInCoreData()
        } else {
            sender.tintColor = UIColor.yellow
            viewModel?.beer.favorite = true
            viewModel?.saveInCoreData()
        }
    }
    
    
    
    func configureTableView() {
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //set constraint
        setTableViewConstraint()
        //set cell
        tableView.register(DetailViewCell.self, forCellReuseIdentifier: "cell")
        //set cell height
        tableView.rowHeight = 30
    }
    
    func setTableViewConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view!.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view!.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view!.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view!.bottomAnchor).isActive = true
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func customiseSections() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
        tableView.isScrollEnabled = false
        tableView.backgroundColor = UIColor.systemGray6
        
    }
    


}

// MARK: - Table view data source

extension DetailViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.numberOfRows() ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        tableViewCell.textLabel?.textAlignment = .center
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel
        

        return tableViewCell
    }
}
