//
//  ExpandableCell.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 26/01/2024.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    static let reuseID = "HeaderCell"
    let titleLabel = UILabel()
    let arrowView = UIImageView()
    let padding: CGFloat = 12


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .secondarySystemGroupedBackground
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(plan: String, image: String = "chevron.forward") {
        titleLabel.text = plan
        arrowView.image = UIImage(systemName: image)
    }
    
    
    func changeChevron() {
        if arrowView.image == UIImage(systemName: "chevron.forward") {
            arrowView.image = UIImage(systemName: "chevron.down")
        } else {
            arrowView.image = UIImage(systemName: "chevron.forward")
        }
    }

    
    func configure() {
        addSubview(titleLabel)
        addSubview(arrowView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        arrowView.contentMode = .scaleAspectFill

        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            arrowView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            arrowView.heightAnchor.constraint(equalToConstant: padding),
        ])
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
}
