//
//  GYMError.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import Foundation

enum GYMError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet conection"
    case invalidData = "The data recieved from the server was invalid. Please try again"
    case invalidImage = "Unable to use data recived as an image"
    case unableToDecode = "There was a problem while trying to decode data."
    case invalidResponse  = "Invalid response from the server. Muscle may not exist"
}
