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
        viewControllers = [createQRAccessVC(), createRoutinesVC(), createProfileVC()]
        selectedIndex = 1
    }
    
    
    func createRoutinesVC() -> UINavigationController {
        let homeVC = RoutinesVC()
        homeVC.tabBarItem = UITabBarItem(title: "Rutinas", image: Images.calendar, tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }

    
    func createQRAccessVC() -> UINavigationController {
        let qrAccessVC = qrAccessVC()
        qrAccessVC.tabBarItem = UITabBarItem(title: "Escanear", image: Images.qrCode, tag: 1)
        return UINavigationController(rootViewController: qrAccessVC)
    }
    
    
    func createProfileVC() -> UINavigationController {
        let profileVC = ProfileVC()
        profileVC.tabBarItem = UITabBarItem(title: "Perfil", image: Images.profile, tag: 2)
        return UINavigationController(rootViewController: profileVC)
    }
}
