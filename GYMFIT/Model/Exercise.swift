//
//  Exercise.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 03/01/2024.
//

import UIKit

struct Exercise: Hashable {
    var name: String
    var muscle: Muscle
    var image: UIImage = .icon
}


struct ExerciseAssigned: Hashable {
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
    let muscle: Muscle
    var exercises: [ExerciseAssigned]
}


enum Muscle: String, Equatable {
    case abdominales = "abdominales"
    case pectoral = "pectoral"
    case espalda = "espalda"
    case trapecio = "trapecio"
    case hombros = "hombros"
    case biceps = "biceps"
    case triceps = "triceps"
    case piernasGluteos = "Piernas/Gluteos"
}
