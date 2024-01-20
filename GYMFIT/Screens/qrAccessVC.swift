//
//  QRAccessVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

class qrAccessVC: GFDataLoadingVC {
    
    let QRimageView = UIImageView()
    let timerLabel = UILabel()
    var timer = Timer()
    var timerCount = 30
    let actionButton = GYMButton(backgroundColor: .systemYellow, title: "Generar código")
    
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureQR()
        configureActionButton()
        configureTimerLabel()
    }
    
    
    func configureViewController() {
        title = "Escanear"
        view.backgroundColor = .systemGroupedBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureQR(){
        view.addSubview(QRimageView)
        QRimageView.image = Images.qrCode
        QRimageView.tintColor = .label
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
        actionButton.addAction(UIAction(handler: { _ in
            self.generateQR()
        }), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func configureTimerLabel(){
        view.addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
 
        NSLayoutConstraint.activate([
            timerLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -30),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func generateQR() {
        timerLabel.text = ""
        timer.invalidate()
        timerCount = 30
        showLoadingView()
        
        Task {
            do{
                let qr = try await NetworkManager.shared.getQR(for: "username")
                self.QRimageView.image = qr
                dismissLoadingView()
                createTimer()
            } catch {
                self.QRimageView.image = Images.qrCode
                dismissLoadingView()
                throw error
            }
        }
    }
    
    
    func createTimer() {
        timerLabel.text = "Válido por 30 segundos"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCountdown), userInfo: nil, repeats: true)
    }
    
    
    @objc func startCountdown() {
        if timerCount != 0 {
            timerCount = timerCount - 1
            timerLabel.text = "Válido por \(timerCount) segundos"
        } else {
            timer.invalidate()
            timerLabel.text = "El código ya no es válido"
        }
    }
}
