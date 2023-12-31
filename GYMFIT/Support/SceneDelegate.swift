//
//  SceneDelegate.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 19/11/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

//        let loginVC = LoginVC()

//        let navigationController = UINavigationController(rootViewController: loginVC)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = GYMTabBarController()
        window?.makeKeyAndVisible()
    }

    func setNewRootViewController() {
        let newNavigationController = GYMTabBarController()
        window?.rootViewController = newNavigationController
        
        UIView.transition(with: window!,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: nil)
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemYellow
    }
    
}

