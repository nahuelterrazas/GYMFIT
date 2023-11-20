//
//  GYMButton.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

var connfigurationButton = UIButton.Configuration.filled()

class GYMButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        connfigurationButton.baseBackgroundColor = backgroundColor.withAlphaComponent(0.85)
        configure()
    }
    
    func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([heightAnchor.constraint(equalToConstant: 50)])
        configuration = connfigurationButton

    }
}
