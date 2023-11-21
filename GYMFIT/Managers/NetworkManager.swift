//
//  NetworkManager.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func getQR(for username: String, completed: @escaping (Result<UIImage, GYMError>) -> Void){
        let endPoint = Constants().QRBaseURL + username + "\(Date())"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completed(.failure(.invalidImage))
                return
            }
            completed(.success(image))
        }
        task.resume()
    }
    
    func getExercises(for muscle: String, completed: @escaping (Result<[exerciseDTO], GYMError>) -> Void){
        let endPoint = Constants().exerciseBaseURL + muscle + "&X-Api-Key=\(Constants().apiKey)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(GYMError.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let exercises = try decoder.decode([exerciseDTO].self, from: data)
                completed(.success(exercises))
            } catch {
                completed(.failure(.unableToDecode))
            }
        }
        task.resume()
    }
    
}
