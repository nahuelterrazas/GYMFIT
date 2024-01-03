//
//  GYMTextField.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

class GYMTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String) {
        super.init(frame: .zero)
        placeholder = text
        configure()
    }
    
    func configure(){
        autocorrectionType = .no
        borderStyle = .roundedRect
        backgroundColor = .systemFill
        autocapitalizationType = .none
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 45)])
    }
    
    
    
}
