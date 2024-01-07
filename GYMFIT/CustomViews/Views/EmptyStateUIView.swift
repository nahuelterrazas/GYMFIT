//
//  EmptyStateUIView.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 05/01/2024.
//

import UIKit

class EmptyStateUIView: UIView {

    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(title: String, subtitle: String) {
        self.init(frame: .zero)
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    
    private func configure() {
        isUserInteractionEnabled = false
        addSubviews(imageView, titleLabel, subtitleLabel)
        
        imageView.image = UIImage(systemName: "party.popper.fill")
        imageView.tintColor = .systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = .boldSystemFont(ofSize: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        subtitleLabel.textColor = .tertiaryLabel
        subtitleLabel.text = "Completaste el día de entrenamiento 💪"
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

        let padding: CGFloat = 15
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -30),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

}
