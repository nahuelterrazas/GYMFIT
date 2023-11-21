//
//  QRAccessVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

class QRAccessVC: UIViewController {
    
    let QRimageView = UIImageView()
    let timerLabel = UILabel()
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
    
    func configureTimer(){
        view.addSubview(timerLabel)
        
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: QRimageView.bottomAnchor, constant: 15),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configureActionButton(){
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(generateQR), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func generateQR() {
        NetworkManager.shared.getQR(for: "usernameLoggedIn") { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let qrCode):
                DispatchQueue.main.async {
                    self.QRimageView.image = qrCode
                }
            case .failure(let failure):
                printContent(failure)
            }
        }
    }

}
