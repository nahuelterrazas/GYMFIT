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
}


enum Images {
    static let qrCode = UIImage(systemName: "qrcode")
    static let calendar = UIImage(systemName: "calendar")
}


enum Exercises {
    static let espinales            = Exercise(title: "Espinales en colchoneta",    serires: 3, reps: 15, image: .superman)
    static let absColchoneta        = Exercise(title: "Abdominales en colchoneta",  serires: 3, reps: 30, image: .abdominalesColchoneta)
    static let chestPress           = Exercise(title: "Chest press",                serires: 4, reps: 10, image: .chestPress)
    static let pecFly               = Exercise(title: "Pec fly",                    serires: 4, reps: 10, image: .pecFly)
    static let curlPolea            = Exercise(title: "Curl con polea",             serires: 4, reps: 10, image: .curlPolea)
    static let concentradoPoleaBic  = Exercise(title: "Concentrado con polea",      serires: 3, reps: 8,  image: .concentradoBic)
    static let prensa90             = Exercise(title: "Prensa 90°",                 serires: 4, reps: 15, image: .prensa90)
    static let legExtension         = Exercise(title: "Leg extension",              serires: 4, reps: 15, image: .legExtension)
    
    static let verticalTrac         = Exercise(title: "Vertical trac",              serires: 4, reps: 10, image: .verticalTraction)
    static let remoAUnBrazo         = Exercise(title: "Remo a un brazo con polea",  serires: 3, reps: 10, image: .remoPolea)
    static let extensionEnPConBarra = Exercise(title: "Extension en P con barra",   serires: 4, reps: 10, image: .extensionP)
    static let concentradoPoleaTri  = Exercise(title: "Concentrado con polea",      serires: 3, reps: 12, image: .concentradoTri)
    static let legCurl              = Exercise(title: "Leg curl (femorales)",       serires: 4, reps: 15, image: .legCurl)
    static let abductores           = Exercise(title: "Máquina de abductores",      serires: 4, reps: 15, image: .abductores)
    
    static let absInfColchoneta     = Exercise(title: "Abominales inferiores",      serires: 3, reps: 20, image: .absInferiores)
    static let oblicuosCruzados     = Exercise(title: "Oblicuos cruzados",          serires: 3, reps: 20, image: .oblicuosCruzados)
    static let aperturaBancoPlano   = Exercise(title: "Apertura en banco plano",    serires: 4, reps: 8,  image: .aperturaBancoPlano)
    static let pressFrancesAcostado = Exercise(title: "Press frances acostado",     serires: 3, reps: 10, image: .pressFrancesAcostado)
    static let pullOverPolea        = Exercise(title: "Pull over con polea",        serires: 4, reps: 12, image: .pullOverPolea)
    static let tironAlMenton        = Exercise(title: "Tirón al menton con polea",  serires: 3, reps: 12, image: .tironAlMentonAlto)
    static let vuelosFrontalesDisco = Exercise(title: "Vuelos frontales con disco", serires: 4, reps: 10, image: .vuelosFrontalesDisco)
    static let bancoScottMancuerna  = Exercise(title: "Banco SCOTT con mancuerna",  serires: 3, reps: 10, image: .bancoSCOTTBiceps)
    
    static let gemelosEnH           = Exercise(title: "Gemelos",                    serires: 4, reps: 15, image: .gemelos)
    static let aductores            = Exercise(title: "Máquina de aductores",       serires: 4, reps: 15, image: .aductores)
    static let sentadillaConManc    = Exercise(title: "Sentadilla con mancuerna",   serires: 4, reps: 15, image: .sentadilla)
    static let hipThrustMat         = Exercise(title: "Hip Thrust con step",        serires: 4, reps: 15, image: .barbellhipthrust)
    static let estocada             = Exercise(title: "Estocada",                   serires: 4, reps: 10, image: .estocada)
}


enum DailyRoutines {
    
    static let day1: [Muscle] = [
        Muscle(title: "ABDOMINALES",     exercises: [Exercises.espinales,
                                                     Exercises.absColchoneta]),
        
        Muscle(title: "PECTORAL",        exercises: [Exercises.chestPress,
                                                     Exercises.pecFly]),
        
        Muscle(title: "BICEPS",          exercises: [Exercises.curlPolea,
                                                     Exercises.concentradoPoleaBic]),
        
        Muscle(title: "PIERNAS/GLUTEOS", exercises: [Exercises.prensa90,
                                                     Exercises.legExtension])
    
    ]
    
    
    static let day2: [Muscle] = [
        Muscle(title: "ESPALDA",         exercises: [Exercises.verticalTrac,
                                                     Exercises.remoAUnBrazo]),
        
        Muscle(title: "TRICEPS",         exercises: [Exercises.extensionEnPConBarra,
                                                     Exercises.concentradoPoleaTri]),
        
        Muscle(title: "PIERNAS/GLUTEOS", exercises: [Exercises.legCurl,
                                                     Exercises.abductores])
    ]

    
    static let day3: [Muscle] = [
        Muscle(title: "ABDOMINALES", exercises: [Exercises.absInfColchoneta,
                                                 Exercises.oblicuosCruzados]),
        
        Muscle(title: "HOMBROS",     exercises: [Exercises.vuelosFrontalesDisco]),
        Muscle(title: "PECTORAL",    exercises: [Exercises.aperturaBancoPlano]),
        Muscle(title: "TRICEPS",     exercises: [Exercises.pressFrancesAcostado]),
        Muscle(title: "BICEPS",      exercises: [Exercises.bancoScottMancuerna]),
        Muscle(title: "ESPALDA",     exercises: [Exercises.pullOverPolea]),
        Muscle(title: "TRAPECIO",    exercises: [Exercises.tironAlMenton])
    ]
    
    
    static let day4: [Muscle] = [
        Muscle(title: "PIERNAS/GLUTEOS", exercises: [Exercises.gemelosEnH,
                                                     Exercises.aductores,
                                                     Exercises.sentadillaConManc,
                                                     Exercises.hipThrustMat,
                                                     Exercises.estocada
                                                    ])
    ]
}
