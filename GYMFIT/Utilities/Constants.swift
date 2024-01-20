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
        Exercises.puenteStep,
        Exercises.estocada,
    ]
    static let heavyWeights: [Double] = [2.5, 5, 7.5, 10, 12.5, 15, 17.5, 20, 22.5, 25, 27.5, 30, 32.5, 35, 37.5, 40, 42.5, 45, 47.5, 50,
                                            52.5, 55, 57.5, 60, 62.5, 65, 67.5, 70, 72.5, 75, 77.5, 80, 82.5, 85, 87.5, 90, 92.5, 95, 97.5, 100]
    static let lowWeights: [Double] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,49,50]
}


enum Images {
    static let qrCode = UIImage(systemName: "qrcode")
    static let calendar = UIImage(systemName: "calendar")
    static let profile = UIImage(systemName: "person.fill")
}


enum Exercises {
    static var espinalesColchoneta      = Exercise(name: "Espinales en colchoneta",    muscle: .abdominales,        image: .superman)
    static var abdominalesColchoneta    = Exercise(name: "Abdominales en colchoneta",  muscle: .abdominales,        image: .abdominalesColchoneta)
    static var chestPress               = Exercise(name: "Chest press",                muscle: .pectoral,           image: .chestPress)
    static var pecFly                   = Exercise(name: "Pec fly",                    muscle: .pectoral,           image: .pecFly)
    static var curlPolea                = Exercise(name: "Curl con polea",             muscle: .biceps,             image: .curlPolea)
    static var concentradoPoleaBiceps   = Exercise(name: "Concentrado con polea",      muscle: .biceps,             image: .concentradoBic)
    static var prensa90                 = Exercise(name: "Prensa 90°",                 muscle: .piernasGluteos,     image: .prensa90)
    static var legExtension             = Exercise(name: "Leg extension",              muscle: .piernasGluteos,     image: .legExtension)

    static var verticalTrac             = Exercise(name: "Vertical trac",              muscle: .espalda,            image: .verticalTraction)
    static var remoAUnBrazo             = Exercise(name: "Remo a un brazo con polea",  muscle: .espalda,            image: .remoPolea)
    static var extensionEnPConBarra     = Exercise(name: "Extension en P con barra",   muscle: .triceps,            image: .extensionP)
    static var concentradoPoleaTriceps  = Exercise(name: "Concentrado con polea ",     muscle: .triceps,            image: .concentradoTri)
    static var legCurl                  = Exercise(name: "Leg curl",                   muscle: .piernasGluteos,     image: .legCurl)
    static var maquinaAbductores        = Exercise(name: "Máquina de abductores",      muscle: .piernasGluteos,     image: .abductores)

    static var abdominalessInferiores   = Exercise(name: "Abdominales inferiores",      muscle: .abdominales,        image: .absInferiores)
    static var oblicuosCruzados         = Exercise(name: "Oblicuos cruzados",          muscle: .abdominales,        image: .oblicuosCruzados)
    static var aperturaBancoPlano       = Exercise(name: "Apertura en banco plano",    muscle: .pectoral,           image: .aperturaBancoPlano)
    static var pressFrancesAcostado     = Exercise(name: "Press frances acostado",     muscle: .triceps,            image: .pressFrancesAcostado)
    static var pullOverPolea            = Exercise(name: "Pull over con polea",        muscle: .espalda,            image: .pullOverPolea)
    static var tironAlMenton            = Exercise(name: "Tirón al menton con polea",  muscle: .trapecio,           image: .tironAlMentonAlto)
    static var vuelosFrontalesDisco     = Exercise(name: "Vuelos frontales con disco", muscle: .hombros,            image: .vuelosFrontalesDisco)
    static var bancoScottMancuerna      = Exercise(name: "Banco SCOTT con mancuerna",  muscle: .biceps,             image: .bancoSCOTTBiceps)

    static var gemelosEnH               = Exercise(name: "Gemelos",                    muscle: .piernasGluteos,     image: .gemelos)
    static var maquinaAductores         = Exercise(name: "Máquina de aductores",       muscle: .piernasGluteos,     image: .aductores)
    static var sentadillaMancuerna      = Exercise(name: "Sentadilla con mancuerna",   muscle: .piernasGluteos,     image: .sentadilla)
    static var puenteStep               = Exercise(name: "Puente con step",            muscle: .piernasGluteos,     image: .puente)
    static var estocada                 = Exercise(name: "Estocada",                   muscle: .piernasGluteos,     image: .estocada)
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
        ExerciseAssigned(exercise: Exercises.concentradoPoleaTriceps,  serires: 3, reps: 12),
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
        ExerciseAssigned(exercise: Exercises.legCurl,                  serires: 4, reps: 15),
        ExerciseAssigned(exercise: Exercises.gemelosEnH,               serires: 4, reps: 15),
        ExerciseAssigned(exercise: Exercises.maquinaAductores,         serires: 4, reps: 15),
        ExerciseAssigned(exercise: Exercises.sentadillaMancuerna,      serires: 3, reps: 15),
        ExerciseAssigned(exercise: Exercises.puenteStep,               serires: 4, reps: 15),
        ExerciseAssigned(exercise: Exercises.estocada,                 serires: 4, reps: 10)
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
        ExercisesByMuscle(muscle: .abdominales, exercises: []),
        ExercisesByMuscle(muscle: .pectoral, exercises: []),
        ExercisesByMuscle(muscle: .espalda, exercises: []),
        ExercisesByMuscle(muscle: .trapecio, exercises: []),
        ExercisesByMuscle(muscle: .hombros, exercises: []),
        ExercisesByMuscle(muscle: .biceps, exercises: []),
        ExercisesByMuscle(muscle: .triceps, exercises: []),
        ExercisesByMuscle(muscle: .piernasGluteos, exercises: [])
    ]
    
    for exercise in exercises {
        switch (exercise.exercise.muscle) {
        case .abdominales:
            list[0].exercises.append(exercise)
        case .pectoral:
            list[1].exercises.append(exercise)
        case .espalda:
            list[2].exercises.append(exercise)
        case .trapecio:
            list[3].exercises.append(exercise)
        case .hombros:
            list[4].exercises.append(exercise)
        case .biceps:
            list[5].exercises.append(exercise)
        case .triceps:
            list[6].exercises.append(exercise)
        case .piernasGluteos:
            list[7].exercises.append(exercise)
        }
    }
    
    list.removeAll { exercise in
        exercise.exercises.isEmpty
    }

    return list
}

