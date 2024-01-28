//
//  ProfileInfoVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/01/2024.
//

import UIKit

class ProfileInfoVC: UIViewController {
    
    let contentView = UIView()
    let profileImage = UIImageView()
    let infoStackView = UIStackView()
    let nameLabel = UILabel()
    let memberSinceLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureImage()
        configureInfoStackView()
    }
    
    func configureLayout() {
        view.addSubview(contentView)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    
    func configureImage() {
        contentView.addSubview(profileImage)
        profileImage.image = .fotoPerfil
        profileImage.layer.borderWidth = 3
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.systemYellow.cgColor
        profileImage.layer.cornerRadius = 65
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFit
        profileImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 130),
            profileImage.heightAnchor.constraint(equalToConstant: 130)
        ])
    }

    
    func configureInfoStackView() {
        view.addSubview(infoStackView)
        infoStackView.axis = .vertical
        infoStackView.spacing = 30
    
        infoStackView.addArrangedSubview(nameLabel)
        nameLabel.text = "Nahuel Terrazas"
        nameLabel.font = .preferredFont(forTextStyle: .largeTitle)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.numberOfLines = 2
        
        infoStackView.addArrangedSubview(memberSinceLabel)
        memberSinceLabel.text = "Miembro desde 17/07/2023"
        memberSinceLabel.textColor = .secondaryLabel
        memberSinceLabel.font = .preferredFont(forTextStyle: .footnote)
        memberSinceLabel.numberOfLines = 0
        memberSinceLabel.adjustsFontSizeToFitWidth = true
        
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            infoStackView.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor)
        ])
    }
    
    
}
