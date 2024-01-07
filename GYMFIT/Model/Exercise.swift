//
//  Exercise.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 03/01/2024.
//

import UIKit

struct Exercise {
    let title: String
    let serires: Int
    let reps: Int
    let image: UIImage
    
    init(title: String, serires: Int, reps: Int) {
        self.title = title
        self.serires = serires
        self.reps = reps
        self.image = .icon
    }
    
    init(title: String, serires: Int, reps: Int, image: UIImage) {
        self.title = title
        self.serires = serires
        self.reps = reps
        self.image = image
    }
}

struct Muscle {
    let title: String
    var exercises: [Exercise]
}


