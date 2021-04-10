//
//  FavoriteViewController.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var tableView = UITableView()
    var segmentControll = UISegmentedControl()
    
    var viewModel: FavoriteViewViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite"
        configureSegment()
        configureTableView()
        view.backgroundColor = UIColor.white

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel?.loadData(completion: {
            self.tableView.reloadData()
        })
        
        tableView.reloadData()
        
    }
    
    //MARK: - Configure Segment
    func configureSegment(){
        segmentControll = UISegmentedControl(items: viewModel?.segmentItems)
        segmentControll.selectedSegmentIndex = 0
        view.addSubview(segmentControll)
        setSegmentConstraint()
        segmentControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == segmentControll {
            viewModel?.selectedSegment(targetIndex: target.selectedSegmentIndex)
            tableView.reloadData()
        }
    }
    
    func setSegmentConstraint() {
        segmentControll.translatesAutoresizingMaskIntoConstraints = false
        segmentControll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        segmentControll.leadingAnchor.constraint(equalTo: view!.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        segmentControll.trailingAnchor.constraint(equalTo: view!.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    //MARK: - Configure Table View
    func configureTableView() {
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //set constraint
        setTableViewConstraint()
        //set cell
        tableView.register(FavoriteViewCell.self, forCellReuseIdentifier: "cell")
        //set cell height
        tableView.rowHeight = 60
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func setTableViewConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: segmentControll.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view!.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view!.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view!.bottomAnchor).isActive = true
    }
    
}

    // MARK: - Table view data source
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FavoriteViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        let dvc = DetailViewController()
        dvc.viewModel = viewModel.viewModelForSelectedRow()
        
        let detailViewController = ModulBuilder.createDetailModule(detailVC: dvc)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
