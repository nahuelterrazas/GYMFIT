//
//  NetworkManager.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let decoder = JSONDecoder()

    private init() { decoder.keyDecodingStrategy = .convertFromSnakeCase }
    
    func getQR(for username: String) async throws -> UIImage? {
        let endPoint = Constants.QRBaseURL + username + "\(Date())"
        
        guard let url = URL(string: endPoint) else { throw GYMError.unableToComplete }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return UIImage(data: data)
    }
    
    func getExercises(for muscle: String) async throws -> [exerciseDTO] {
        let endPoint = Constants.exerciseBaseURL + muscle + "&X-Api-Key=\(Constants.apiKey)"
        
        guard let url = URL(string: endPoint) else { throw GYMError.unableToComplete }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw GYMError.invalidResponse }
        
        do {
            return try decoder.decode([exerciseDTO].self, from: data)
        } catch {
            throw GYMError.unableToDecode
        }
    }
    
}
