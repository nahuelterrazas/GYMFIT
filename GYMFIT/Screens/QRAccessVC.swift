//
//  QRAccessVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

class QRAccessVC: UIViewController {
    
    let QRimageView = UIImageView()
    let actionButton = GYMButton(backgroundColor: .systemYellow, title: "Generate new code")

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureQR()
        configureActionButton()
    }
    
    func configureViewController() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
    }
    
    func configureQR(){
        view.addSubview(QRimageView)
        QRimageView.image = UIImage(systemName: "qrcode.viewfinder")
        QRimageView.tintColor = .white
        QRimageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            QRimageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            QRimageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            QRimageView.heightAnchor.constraint(equalToConstant: 300),
            QRimageView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func configureActionButton(){
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
        
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
