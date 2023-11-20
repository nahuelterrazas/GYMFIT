//
//  ViewController.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 19/11/2023.
//

import UIKit

class LoginVC: UIViewController {

    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let usernameTextField = GYMTextField(text: "Enter a username")
    let passwordTextField = GYMTextField(text: "Enter your password")
    let actionButton = GYMButton(backgroundColor: .systemYellow, title: "Log In")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureLogo()
        configureUsernameTF()
        configurePasswordTF()
        ConfigureLoginButton()
        createDismissKeyboardGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func configureViewController(){
        view.backgroundColor = .black
    }
    
    func configureLogo(){
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "icon")
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200)
        ])
    }
    
    func configureUsernameTF(){
        view.addSubview(usernameTextField)
        usernameTextField.returnKeyType = .continue
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }

    func configurePasswordTF(){
        view.addSubview(passwordTextField)
        passwordTextField.returnKeyType = .go
        passwordTextField.delegate = self
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    func ConfigureLoginButton(){
        view.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(pushHomeVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    func createDismissKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushHomeVC(){
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setNewRootViewController()
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            // falta el control de datos
            pushHomeVC()
        }
        return true
    }

}



//    func configureLabel(){
//        view.addSubview(titleLabel)
//        titleLabel.text = "GYM"
//        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
//        titleLabel.textColor = .white
//
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
//            titleLabel.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor)
//        ])
//    }
