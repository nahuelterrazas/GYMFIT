//
//  TableViewHeader.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 06/01/2024.
//

import UIKit

class TableViewHeader: UIView {

    init(frame: CGRect, button: UIButton) {
        super.init(frame: frame)
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     button.widthAnchor.constraint(equalToConstant: 150),
                                     button.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
