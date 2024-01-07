//
//  ExerciseInfoVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 04/01/2024.
//

import UIKit

class ExerciseInfoVC: UIViewController {
    
    let imageView = UIImageView()

    
    init(title: String, image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = title
        imageView.image = image
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureImageView()
    }
    

    func configure() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = doneButton
        view.backgroundColor = .systemBackground
    }

    
    func configureImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, constant: 10)
        ])
    }
    
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
}
