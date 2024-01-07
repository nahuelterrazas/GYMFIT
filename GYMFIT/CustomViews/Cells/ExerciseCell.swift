//
//  ExerciseCell.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 03/01/2024.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    static let reuseID = "ExerciseCell"
    let stackView = UIStackView()
    let titleLabel = UILabel()
    let seriesLabel = SquareTextUIView()
    let repsLabel = SquareTextUIView()
    let padding: CGFloat = 12


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .secondarySystemGroupedBackground
        configureStackView()
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(exercise: Exercise) {
        titleLabel.text = exercise.title
        seriesLabel.set(number: exercise.serires)
        repsLabel.set(number: exercise.reps)
    }
    
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually        
        stackView.addArrangedSubview(seriesLabel)
        stackView.addArrangedSubview(repsLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 80)
        ])
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
        seriesLabel.textLabel.text = ""
        repsLabel.textLabel.text = ""
    }
}
