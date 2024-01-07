//
//  GYMPopUpButton.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 06/01/2024.
//

import UIKit


class GYMPopUpButton: UIButton {
    
    weak var delegate: RoutinesVCDelegate! 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        menu = UIMenu(children: [
            UIAction(title: "Día 1" , handler: { _ in
                self.delegate.changeTableView()
            }),
            UIAction(title: "Día 2", handler: { _ in
                self.delegate.changeTableView()
            }),
            UIAction(title: "Día 3", handler: { _ in
                self.delegate.changeTableView()
            }),
            UIAction(title: "Día 4", handler: { _ in
                self.delegate.changeTableView()
            })
        ])
        
        showsMenuAsPrimaryAction = true
        changesSelectionAsPrimaryAction = true
        setTitleColor(.label, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 35, weight: .bold)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
