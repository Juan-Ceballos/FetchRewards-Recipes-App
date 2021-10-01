//
//  FetchRewards_Recipes_AppTests.swift
//  FetchRewards-Recipes-AppTests
//
//  Created by Juan Ceballos on 9/30/21.
//

import XCTest
@testable import FetchRewards_Recipes_App

class FetchRewards_Recipes_AppTests: XCTestCase {
    func testNetworkHelper() {
        let exp = XCTestExpectation(description: "data fetched")
        guard let url = URL(string: Endpoints.categoriesEP) else {
            XCTFail("bad url")
            return
        }
        let urlRequest = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(request: urlRequest) { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
                XCTFail("\(appError)")
            case .success(let data):
                exp.fulfill()
                XCTAssertGreaterThan(data.count, 10_000, "data should be greater than \(data.count)")
            }
        }
        
        wait(for: [exp], timeout: 5.0)
    }
    
    func testFetchCategories() {
        let exp = XCTestExpectation(description: "Categories Fetched")
        let numberOfCategories = 14
        
        TheMealDBAPI.fetchCategories { (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTFail("\(error)")
            case .success(let categories):
                exp.fulfill()
                XCTAssertEqual(categories.count, numberOfCategories)
            }
        }
        
        wait(for: [exp], timeout: 5.0)
    }
    
    func testFectchCategoryImage() {
        let exp = XCTestExpectation(description: "Image URL Parsed")
        let urlString = "https://www.themealdb.com/images/category/beef.png"
        ImageClient.fetchImage(for: urlString) { (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTFail("\(error)")
            case .success(let image):
                exp.fulfill()
                XCTAssertEqual(image.size.width, 320)
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    func testFetchMealsFromCategory() {
        let exp = XCTestExpectation(description: "Meals array based on category")
        let numberOfMealsInBeefCategory = 42
        TheMealDBAPI.fetchMealsFromCategory(categoryStr: "beef") { (result) in
            switch result {
            case .failure(let error):
                print(error)
                XCTFail("\(error)")
            case .success(let mealsInCategory):
                exp.fulfill()
                XCTAssertEqual(mealsInCategory.count, numberOfMealsInBeefCategory)
            }
        }
        wait(for: [exp], timeout: 5.0)
    }
}
