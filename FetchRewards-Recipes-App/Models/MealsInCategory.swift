//
//  MealsInCategory.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/1/21.
//

import Foundation

struct MealsInCategoryWrapper: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable, Hashable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
