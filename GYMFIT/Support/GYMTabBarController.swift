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
        viewControllers = [createQRAccessVC(), createHomeVC()]
    }
    
    func createHomeVC() -> UINavigationController {
        let homeVC = RoutinesVC()
        homeVC.title = "Routines"
        homeVC.tabBarItem = UITabBarItem(title: "Routines", image: UIImage(systemName: "calendar"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }

    func createQRAccessVC() -> UINavigationController {
        let QRAccessVC = QRAccessVC()
        QRAccessVC.title = "Scan to access"
        QRAccessVC.tabBarItem = UITabBarItem(title: "QR", image: UIImage(systemName: "qrcode"), tag: 1)
        return UINavigationController(rootViewController: QRAccessVC)
    }

}
