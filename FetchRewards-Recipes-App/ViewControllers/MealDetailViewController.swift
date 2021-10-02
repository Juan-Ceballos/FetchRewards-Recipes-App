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
                DispatchQueue.main.async {
                    self?.mealDetailView.mealImageView.image = image
                }
            }
        }
    }
    
    private func setupUI() {
        TheMealDBAPI.fetchMealFromId(idStr: currentMeal.idMeal) { [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.showAlert(title: "Failed to Retrieve Meal", message: "\(error)")
            case .success(let mealById):
                DispatchQueue.main.async {
                    self?.mealDetailView.mealNameLabel.text = mealById.strMeal
                    self?.mealDetailView.mealInstrunctionsTextView.text = mealById.strInstructions
                }
            }
        }
    }

}
