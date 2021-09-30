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
}
