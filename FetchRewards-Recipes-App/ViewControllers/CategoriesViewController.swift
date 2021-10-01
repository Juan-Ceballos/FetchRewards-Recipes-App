//
//  ViewController.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 9/30/21.
//

import UIKit

class CategoriesViewController: UIViewController {

    private let categoriesView = CategoriesView()
    
    override func loadView() {
        view = categoriesView
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Category>
    private var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        configureCV()
        configureDataSource()
    }
    
    private func configureCV() {
        categoriesView.cv.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Category>(collectionView: categoriesView.cv, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else {
                fatalError()
            }
            cell.categoryLabel.text = item.strCategory
            cell.categoryImageView.image = UIImage(systemName: "book")
            
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Category>()
        TheMealDBAPI.fetchCategories { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let categories):
                snapshot.appendSections([.main])
                snapshot.appendItems(categories)
                self.dataSource.apply(snapshot, animatingDifferences: false)
            }
        }
    }
    
    
}

