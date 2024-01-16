//
//  Exercise.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 03/01/2024.
//

import UIKit

struct Exercise {
    var name: String
    var muscle: String
    var image: UIImage = .icon
}


struct ExerciseAssigned {
    var exercise: Exercise
    var serires: Int
    var reps: Int
    var weight: Int = 15
}


struct ExerciseSQL {
    var id: Int = 1
    var name: String
    var weightRow: Int = 15
}


struct ExercisesByMuscle {
    let muscle: String
    var exercises: [ExerciseAssigned]
}
