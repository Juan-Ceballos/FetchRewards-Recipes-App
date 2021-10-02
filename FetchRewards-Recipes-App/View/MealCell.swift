//
//  MealCell.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//

import UIKit

class MealCell: UICollectionViewCell {
    
    static let reuseIdentifier = "mealCell"
    
    public lazy var mealNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var mealImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
        
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupmealNameLabelConstraints()
        setupCategoryImageViewConstraints()
    }
    
    private func setupmealNameLabelConstraints() {
        addSubview(mealNameLabel)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            mealNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            mealNameLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    private func setupCategoryImageViewConstraints() {
        addSubview(mealImageView)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 8),
            mealImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            mealImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            mealImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
