//
//  FetchRewards_Recipes_AppTests.swift
//  FetchRewards-Recipes-AppTests
//
//  Created by Juan Ceballos on 9/30/21.
//

import XCTest
@testable import FetchRewards_Recipes_App

class FetchRewards_Recipes_AppTests: XCTestCase {
    
    func testFetchCategoryImage() {
        let exp = XCTestExpectation(description: "Image URL Parsed")
        let urlString = "https://www.themealdb.com/images/category/beef.png"
        ImageClient.fetchImage(for: urlString) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTFail("\(error)")
            case .success(let image):
                exp.fulfill()
                XCTAssertEqual(image!.size.width, 320)
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    func testFetch() {
        let categories = APIClient<CategoriesWrapper>()
        let exp = XCTestExpectation(description: "Fectched Categories")
        let numberOfCategories = 14
        categories.fetch(url: Endpoints.categoriesEP) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTFail("\(error)")
            case .success(let categories):
                exp.fulfill()
                XCTAssertEqual(categories.categories.count, numberOfCategories)
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    func testFectchMeals() {
        let exp = XCTestExpectation(description: "Meals array based on category")
        let numberOfMealsInBeefCategory = 42
        let mealsCategory = APIClient<MealsInCategoryWrapper>()
        mealsCategory.fetch(url: Endpoints.mealsFromCategory + "beef") { (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTFail("\(error)")
            case .success(let mealsCat):
                exp.fulfill()
                XCTAssertEqual(mealsCat.meals.count, numberOfMealsInBeefCategory)
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    func testFetchMealsID() {
        let exp = XCTestExpectation(description: "Fetched meal based on ID")
        let mealName = "Moussaka"
        let mealsById = APIClient<MealsInCategoryWrapper>()
        mealsById.fetch(url: Endpoints.mealById + "53006") { (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTFail("\(error)")
            case .success(let mealId):
                exp.fulfill()
                XCTAssertEqual(mealId.meals[0].strMeal, mealName)
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
}
