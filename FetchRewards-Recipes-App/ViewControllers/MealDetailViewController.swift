//
//  MealDetailViewController.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    private let currentMeal: Meal
    private let mealDetailView = MealDetailView()
    
    init(currentMeal: Meal) {
        self.currentMeal = currentMeal
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = mealDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        loadImage()
        setupUI()
    }
    
    private func loadImage() {
        ImageClient.fetchImage(for: currentMeal.strMealThumb) { [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.showAlert(title: "Failed to Show Image", message: "\(error)")
            case .success(let image):
                self?.mealDetailView.mealImageView.image = image
            }
        }
    }
    
    private func setupUI() {
        let mealFromId = APIClient<MealsInCategoryWrapper>()
        mealFromId.fetch(url: Endpoints.mealById + "\(currentMeal.idMeal)") { [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.showAlert(title: "Failed to Retrieve Meal", message: "\(error)")
            case .success(let mealById):
                guard let idMeal = mealById.meals.first else {
                    self?.showAlert(title: "Error", message: "Failed to Retrive Meal Info")
                    return
                }
                self?.mealDetailView.mealNameLabel.text = idMeal.strMeal
                self?.mealDetailView.mealInstrunctionsTextView.text = idMeal.strInstructions
                var str = ""
                let x = idMeal.ingredientArr.compactMap{$0}.filter{!$0.isEmpty}
                let y = idMeal.measuresArr.compactMap{$0}.filter{!$0.isEmpty}

                for num in 0..<x.count {
                    str += "\(x[num]), \(y[num]) \n"
                }
                self?.mealDetailView.mealIngredientsMeasurementsTextView.text = str
            }
        }
    }

}
