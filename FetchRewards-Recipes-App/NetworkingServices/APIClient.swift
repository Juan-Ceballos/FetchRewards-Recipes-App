//
//  APIClient.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//
import Foundation

class APIClient<T: Decodable> {
    func fetch(url: String, completion: @escaping (Result<T, AppError>) -> ()) {
        guard let endpoint = URL(string: url) else { return }

        URLSession.shared.dataTask(with: endpoint) { data, response, error in
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
                do {
                    let results = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }.resume()
    }
}
