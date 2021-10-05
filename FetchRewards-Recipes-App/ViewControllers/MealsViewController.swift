//
//  MealsViewController.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//

import UIKit

class MealsViewController: UIViewController {
    
    private let currentCategory: String
    private let mealsView = MealsView()
    private typealias DataSource = UICollectionViewDiffableDataSource<MealSection, Meal>
    private var dataSource: DataSource!
    
    init(currentCategory: String) {
        self.currentCategory = currentCategory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = mealsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCV()
        configureDataSource()
        navigationItem.title = currentCategory
    }
    
    private func configureCV() {
        mealsView.cv.register(MealCell.self, forCellWithReuseIdentifier: MealCell.reuseIdentifier)
        mealsView.cv.delegate = self
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<MealSection, Meal>(collectionView: mealsView.cv, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCell.reuseIdentifier, for: indexPath) as? MealCell else {
                fatalError()
            }
            cell.mealNameLabel.text = item.strMeal
            cell.backgroundColor = .systemOrange
            let itemThumbStr = item.strMealThumb
            ImageClient.fetchImage(for: itemThumbStr) { [weak cell, weak self] (result) in
                switch result {
                case .failure(let error):
                    self?.showAlert(title: "Failed to Show Image", message: "\(error)")
                case .success(let image):
                    cell?.mealImageView.image = image
                }
            }
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<MealSection, Meal>()
        
        let mealsFromCategory = APIClient<MealsInCategoryWrapper>()
        mealsFromCategory.fetch(url: Endpoints.mealsFromCategory + "\(currentCategory)") { [weak self] (result) in
            switch result {
            case .failure(let error):
                self?.showAlert(title: "Failed to Retrieve Meals", message: "\(error)")
            case .success(let mealsWrapper):
                snapshot.appendSections([.main])
                snapshot.appendItems(mealsWrapper.meals)
                self?.dataSource.apply(snapshot, animatingDifferences: false)
            }
        }
    }
   
}

extension MealsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedMeal = dataSource.itemIdentifier(for: indexPath) else {
            fatalError()
        }
        
        let mealDetailVC = MealDetailViewController(currentMeal: selectedMeal)
        self.navigationController?.pushViewController(mealDetailVC, animated: false)
    }
}
