//
//  MealCell.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//

import UIKit

class MealCell: UICollectionViewCell {
    
    static let reuseIdentifier = "mealCell"
    let padding: CGFloat = 8
    let heightMultiplier: CGFloat = 0.7
    
    public var mealNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    public var mealImageView: UIImageView = {
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
            mealNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            mealNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            mealNameLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    private func setupCategoryImageViewConstraints() {
        addSubview(mealImageView)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: padding),
            mealImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            mealImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: heightMultiplier),
            mealImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
