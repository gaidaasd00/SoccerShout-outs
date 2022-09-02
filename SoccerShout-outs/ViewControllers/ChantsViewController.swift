//
//  ChantsViewController.swift
//  SoccerShout-outs
//
//  Created by Алексей Гайдуков on 01.09.2022.
//

import UIKit

class ChantsViewController: UIViewController {

    //MARK: - UI
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cell)
        return tableView
    }()
    
    private lazy var teamsViewModel = TeamsViewModel()
    
    
    // MARK: - Lyfecycle
    //make adjustments more efficiently UI
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .white
    }
}
    // MARK: - Extension
extension ChantsViewController {
    func setup() {
        //Setting navigationViewController
        navigationController?.navigationBar.topItem?.title = "Football Shout-outs"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //allows you to return the data we want to see on the screen
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        //setupConstreins
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension ChantsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsViewModel.teams.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teamsViewModel.teams[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cell, for: indexPath) as? TeamTableViewCell else { return UITableViewCell()}
        cell.configure(with: team)
        return cell
    }
}
