//
//  Constants.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

enum Constants {
    static let QRBaseURL = "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data="
    static let exerciseBaseURL = "https://api.api-ninjas.com/v1/exercises?muscle="
    static let apiKey = "IuQs31mLGIb4wuAbnp4EYxB1JY95fBYlcXbOmlbf"
    static let listOfAllExercises = [
        Exercises.espinalesColchoneta,
        Exercises.abdominalesColchoneta,
        Exercises.chestPress,
        Exercises.pecFly,
        Exercises.curlPolea,
        Exercises.concentradoPoleaBiceps,
        Exercises.prensa90,
        Exercises.legExtension,
        Exercises.verticalTrac,
        Exercises.remoAUnBrazo,
        Exercises.extensionEnPConBarra,
        Exercises.concentradoPoleaTriceps,
        Exercises.legCurl,
        Exercises.maquinaAbductores,
        Exercises.abdominalessInferiores,
        Exercises.oblicuosCruzados,
        Exercises.aperturaBancoPlano,
        Exercises.pressFrancesAcostado,
        Exercises.pullOverPolea,
        Exercises.tironAlMenton,
        Exercises.vuelosFrontalesDisco,
        Exercises.bancoScottMancuerna,
        Exercises.gemelosEnH,
        Exercises.maquinaAductores,
        Exercises.sentadillaMancuerna,
        Exercises.hipThrustMat,
        Exercises.estocada,
    ]
}


enum Images {
    static let qrCode = UIImage(systemName: "qrcode")
    static let calendar = UIImage(systemName: "calendar")
    static let profile = UIImage(systemName: "person.fill")
}


enum Exercises {
    static var espinalesColchoneta      = Exercise(name: "Espinales en colchoneta",    muscle: "Abdominales",        image: .superman)
    static var abdominalesColchoneta    = Exercise(name: "Abdominales en colchoneta",  muscle: "Abdominales",        image: .abdominalesColchoneta)
    static var chestPress               = Exercise(name: "Chest press",                muscle: "Pectoral",           image: .chestPress)
    static var pecFly                   = Exercise(name: "Pec fly",                    muscle: "Pectoral",           image: .pecFly)
    static var curlPolea                = Exercise(name: "Curl con polea",             muscle: "Biceps",             image: .curlPolea)
    static var concentradoPoleaBiceps   = Exercise(name: "Concentrado con polea",      muscle: "Biceps",             image: .concentradoBic)
    static var prensa90                 = Exercise(name: "Prensa 90°",                 muscle: "Piernas/Gluteos",    image: .prensa90)
    static var legExtension             = Exercise(name: "Leg extension",              muscle: "Piernas/Gluteos",    image: .legExtension)

    static var verticalTrac             = Exercise(name: "Vertical trac",              muscle: "Espalda",            image: .verticalTraction)
    static var remoAUnBrazo             = Exercise(name: "Remo a un brazo con polea",  muscle: "Espalda",            image: .remoPolea)
    static var extensionEnPConBarra     = Exercise(name: "Extension en P con barra",   muscle: "Triceps",            image: .extensionP)
    static var concentradoPoleaTriceps  = Exercise(name: "Concentrado con polea ",     muscle: "Triceps",            image: .concentradoTri)
    static var legCurl                  = Exercise(name: "Leg curl (femorales)",       muscle: "Piernas/Gluteos",    image: .legCurl)
    static var maquinaAbductores        = Exercise(name: "Máquina de abductores",      muscle: "Piernas/Gluteos",    image: .abductores)

    static var abdominalessInferiores   = Exercise(name: "Abominales inferiores",      muscle: "Abdominales",        image: .absInferiores)
    static var oblicuosCruzados         = Exercise(name: "Oblicuos cruzados",          muscle: "Abdominales",        image: .oblicuosCruzados)
    static var aperturaBancoPlano       = Exercise(name: "Apertura en banco plano",    muscle: "Pectoral",           image: .aperturaBancoPlano)
    static var pressFrancesAcostado     = Exercise(name: "Press frances acostado",     muscle: "Triceps",            image: .pressFrancesAcostado)
    static var pullOverPolea            = Exercise(name: "Pull over con polea",        muscle: "Espalda",            image: .pullOverPolea)
    static var tironAlMenton            = Exercise(name: "Tirón al menton con polea",  muscle: "Trapecio",           image: .tironAlMentonAlto)
    static var vuelosFrontalesDisco     = Exercise(name: "Vuelos frontales con disco", muscle: "Hombros",            image: .vuelosFrontalesDisco)
    static var bancoScottMancuerna      = Exercise(name: "Banco SCOTT con mancuerna",  muscle: "Biceps",             image: .bancoSCOTTBiceps)

    static var gemelosEnH               = Exercise(name: "Gemelos",                    muscle: "Piernas/Gluteos",    image: .gemelos)
    static var maquinaAductores         = Exercise(name: "Máquina de aductores",       muscle: "Piernas/Gluteos",    image: .aductores)
    static var sentadillaMancuerna      = Exercise(name: "Sentadilla con mancuerna",   muscle: "Piernas/Gluteos",    image: .sentadilla)
    static var hipThrustMat             = Exercise(name: "Hip Thrust con step",        muscle: "Piernas/Gluteos",    image: .barbellhipthrust)
    static var estocada                 = Exercise(name: "Estocada",                   muscle: "Piernas/Gluteos",    image: .estocada)
}


enum DailyRoutines {
    
    static let day1: [ExerciseAssigned] = [
        ExerciseAssigned(exercise: Exercises.espinalesColchoneta,      serires: 3, reps: 15),
        ExerciseAssigned(exercise: Exercises.abdominalesColchoneta,    serires: 3, reps: 30),
        ExerciseAssigned(exercise: Exercises.chestPress,               serires: 4, reps: 10),
        ExerciseAssigned(exercise: Exercises.pecFly,                   serires: 4, reps: 10),
        ExerciseAssigned(exercise: Exercises.curlPolea,                serires: 4, reps: 10),
        ExerciseAssigned(exercise: Exercises.concentradoPoleaBiceps,   serires: 3, reps: 8),
        ExerciseAssigned(exercise: Exercises.prensa90,                 serires: 4, reps: 15),
        ExerciseAssigned(exercise: Exercises.legExtension,             serires: 4, reps: 15)
    ]
        
        
    static let day2: [ExerciseAssigned] = [
        ExerciseAssigned(exercise: Exercises.verticalTrac,             serires: 4, reps: 10),
        ExerciseAssigned(exercise: Exercises.remoAUnBrazo,             serires: 3, reps: 10),
        ExerciseAssigned(exercise: Exercises.extensionEnPConBarra,     serires: 4, reps: 10),
        ExerciseAssigned(exercise: Exercises.concentradoPoleaTriceps,  serires: 3, reps: 10),
        ExerciseAssigned(exercise: Exercises.legCurl,                  serires: 4, reps: 15),
        ExerciseAssigned(exercise: Exercises.maquinaAbductores,        serires: 4, reps: 15)
    ]

    
    static let day3: [ExerciseAssigned] = [
        ExerciseAssigned(exercise: Exercises.abdominalessInferiores,   serires: 3, reps: 20),
        ExerciseAssigned(exercise: Exercises.oblicuosCruzados,         serires: 3, reps: 20),
        ExerciseAssigned(exercise: Exercises.vuelosFrontalesDisco,     serires: 4, reps: 10),
        ExerciseAssigned(exercise: Exercises.aperturaBancoPlano,       serires: 4, reps: 8),
        ExerciseAssigned(exercise: Exercises.pressFrancesAcostado,     serires: 3, reps: 10),
        ExerciseAssigned(exercise: Exercises.bancoScottMancuerna,      serires: 3, reps: 10),
        ExerciseAssigned(exercise: Exercises.pullOverPolea,            serires: 4, reps: 12),
        ExerciseAssigned(exercise: Exercises.tironAlMenton,            serires: 3, reps: 12)
    ]
    
    
    static let day4: [ExerciseAssigned] = [
        ExerciseAssigned(exercise: Exercises.gemelosEnH,               serires: 4, reps: 10),
        ExerciseAssigned(exercise: Exercises.maquinaAductores,         serires: 4, reps: 10),
        ExerciseAssigned(exercise: Exercises.sentadillaMancuerna,      serires: 3, reps: 10),
        ExerciseAssigned(exercise: Exercises.hipThrustMat,             serires: 4, reps: 15),
        ExerciseAssigned(exercise: Exercises.estocada,                 serires: 4, reps: 15)
    ]
}


enum DailyRoutinesByMuscle {
    static let day1: [ExercisesByMuscle] = orderByMuscle(exercises: DailyRoutines.day1)
    static let day2: [ExercisesByMuscle] = orderByMuscle(exercises: DailyRoutines.day2)
    static let day3: [ExercisesByMuscle] = orderByMuscle(exercises: DailyRoutines.day3)
    static let day4: [ExercisesByMuscle] = orderByMuscle(exercises: DailyRoutines.day4)
}


func orderByMuscle (exercises: [ExerciseAssigned]) -> [ExercisesByMuscle] {
    var list = [
        ExercisesByMuscle(muscle: "Abdominales", exercises: []),
        ExercisesByMuscle(muscle: "Pectoral", exercises: []),
        ExercisesByMuscle(muscle: "Espalda", exercises: []),
        ExercisesByMuscle(muscle: "Trapecio", exercises: []),
        ExercisesByMuscle(muscle: "Hombros", exercises: []),
        ExercisesByMuscle(muscle: "Biceps", exercises: []),
        ExercisesByMuscle(muscle: "Triceps", exercises: []),
        ExercisesByMuscle(muscle: "Piernas/Gluteos", exercises: [])
    ]
    
    for exercise in exercises {
        switch (exercise.exercise.muscle) {
        case "Abdominales":
            list[0].exercises.append(exercise)
        case "Pectoral":
            list[1].exercises.append(exercise)
        case "Espalda":
            list[2].exercises.append(exercise)
        case "Trapecio":
            list[3].exercises.append(exercise)
        case "Hombros":
            list[4].exercises.append(exercise)
        case "Biceps":
            list[5].exercises.append(exercise)
        case "Triceps":
            list[6].exercises.append(exercise)
        case "Piernas/Gluteos":
            list[7].exercises.append(exercise)
        default:
            break
        }
    }
    
    list.removeAll { exercise in
        exercise.exercises.isEmpty
    }

    return list
}

