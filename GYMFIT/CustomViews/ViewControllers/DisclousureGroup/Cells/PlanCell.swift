//
//  PlanCell.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 23/01/2024.
//

import UIKit

class PlanCell: UITableViewCell {
    
    static let reuseID = "PlanCell"
    let titleLabel = UILabel()
    let padding: CGFloat = 12


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .secondarySystemGroupedBackground
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(plan: String) {
        titleLabel.text = plan
    }

    
    func configure() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
}
