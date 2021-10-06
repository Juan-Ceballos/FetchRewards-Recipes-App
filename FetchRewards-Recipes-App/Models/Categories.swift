//
//  Categories.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 9/30/21.
//

import Foundation

struct CategoriesWrapper: Decodable {
    let categories: [Category]
}

struct Category: Decodable, Hashable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
    var tableImageNames: [String] {
    return["table1","table2","table3","table4","table5","table6","table7","table8","table9","table10","table11","table12", "table13", "table14"]
    }
}
