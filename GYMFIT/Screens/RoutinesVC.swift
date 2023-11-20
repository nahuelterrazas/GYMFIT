//
//  HomeVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

class RoutinesVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }

    func configureViewController(){
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
    }
    
}
