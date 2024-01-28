//
//  DisclousureTableView.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 22/01/2024.
//

import UIKit


class DisclousureTableView: UIViewController {
    
    var isExpandableCellsHidden = true
    let headerView = UIView()
    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTablenView()
    }
    
    func configureViewController() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .clear
    }
    
    func configureTablenView() {
        view.addSubview(tableView)
        tableView.rowHeight = 50
        tableView.isScrollEnabled = false
        tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.reuseID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        DispatchQueue.main.async {
            childVC.view.frame = containerView.bounds
        }
        childVC.didMove(toParent: self)
    }
}


