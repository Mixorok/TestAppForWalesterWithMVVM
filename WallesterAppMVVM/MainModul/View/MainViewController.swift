//
//  MainTableViewController.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import UIKit


class MainViewController: UITableViewController {
    
    var viewModel: MainViewViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All beers"
        configureTableView()
        
    }
    
    func configureTableView() {
        tableView.register(MainViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 60
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }

        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        let dvc = DetailViewController()
        dvc.viewModel = viewModel.viewModelForSelectedRow()

        let detailViewController = ModulBuilder.createDetailModule(detailVC: dvc)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
  
}
