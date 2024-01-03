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
    static let qrPlaceholder = UIImage(systemName: "qrcode.viewfinder")
    static let qrCode = UIImage(systemName: "qrcode")
    static let calendar = UIImage(systemName: "calendar")
}
