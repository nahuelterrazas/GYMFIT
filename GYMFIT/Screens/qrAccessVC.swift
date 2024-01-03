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
    let actionButton = GYMButton(backgroundColor: .systemYellow, title: "Generate new code")


    required init() {
        super.init(nibName: nil, bundle: nil)
        title = "Scan to access"
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
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
    }
    
    
    func configureQR(){
        view.addSubview(QRimageView)
        QRimageView.image = Images.qrPlaceholder
        QRimageView.tintColor = .white
        QRimageView.layer.cornerRadius = 40
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
        actionButton.addTarget(self, action: #selector(generateQR), for: .touchUpInside)
        
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
    
    
    @objc func generateQR() {
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
                self.QRimageView.image = Images.qrPlaceholder
                dismissLoadingView()
                throw error
            }
        }
    }
    
    
    func createTimer() {
        timerLabel.text = "Valid for 30 seconds"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startCountdown), userInfo: nil, repeats: true)
    }
    
    
    @objc func startCountdown() {

        if timerCount != 0 {
            timerCount = timerCount - 1
            timerLabel.text = "Valid for \(timerCount) seconds"
        } else {
            timer.invalidate()
            timerLabel.text = " This code is no longer available"
        }
    }
}
