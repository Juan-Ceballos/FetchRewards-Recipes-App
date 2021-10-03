//
//  APIClient.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//
import Foundation

class APIClient<T: Decodable> {
    func fetch(url: String, completion: @escaping (Result<T, Error>) -> ()) {
        guard let endpoint = URL(string: url) else { return }

        URLSession.shared.dataTask(with: endpoint) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(results))
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
