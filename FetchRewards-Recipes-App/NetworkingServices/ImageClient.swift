//
//  ImageClient.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/1/21.
//

import UIKit

struct ImageClient {
    static func fetchImage(for urlString: String, completion: @escaping (Result<UIImage, AppError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(request: request) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                completion(.failure(.networkClientError(error)))
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                } else {
                    completion(.failure(.badURL(urlString)))
                }
                
            }
        }
    }
    
    static func fetchImage2(for urlString: String, completion: @escaping (Result<UIImage?, AppError>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkClientError(error)))
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            switch urlResponse.statusCode {
            case 200...299:
                break
            default:
                completion(.failure(.badStatusCode(urlResponse.statusCode)))
                return
            }
            
            if let data = data {
                let image  = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
