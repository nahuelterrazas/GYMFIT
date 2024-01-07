//
//  ViewController.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

class GYMTabBarController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemYellow
        viewControllers = [createQRAccessVC(), createRoutinesVC()]
    }
    
    
    func createRoutinesVC() -> UINavigationController {
        let homeVC = RoutinesVC()
        homeVC.tabBarItem = UITabBarItem(title: "Rutinas", image: Images.calendar, tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }

    
    func createQRAccessVC() -> UINavigationController {
        let qrAccessVC = qrAccessVC()
        qrAccessVC.tabBarItem = UITabBarItem(title: "QR", image: Images.qrCode, tag: 1)
        return UINavigationController(rootViewController: qrAccessVC)
    }

}
