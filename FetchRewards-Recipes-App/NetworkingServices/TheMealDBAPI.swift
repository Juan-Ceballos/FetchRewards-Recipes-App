//
//  TheMealDBAPI.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 9/30/21.
//

import Foundation

class TheMealDBAPI {
    public static func fetchCategories(completion: @escaping (Result<[Category], AppError>) -> ()) {
        let urlString = Endpoints.categoriesEP
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(request: request) { (result) in
            switch result {
            case .failure(let error):
                print("Data task error: \(error)")
            case .success(let data):
                do {
                    let categoriesWrapper = try JSONDecoder().decode(CategoriesWrapper.self, from: data)
                    let categories = categoriesWrapper.categories
                    completion(.success(categories))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    public static func fetchCategoryImage() {
        
    }
}
