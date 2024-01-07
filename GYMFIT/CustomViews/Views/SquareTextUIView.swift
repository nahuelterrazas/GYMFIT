//
//  squareTextUIView.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 04/01/2024.
//

import UIKit

class SquareTextUIView: UIView {
    
    let textLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(number: Int) {
        textLabel.text = String(number)
    }
    
    
    private func configure() {
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
