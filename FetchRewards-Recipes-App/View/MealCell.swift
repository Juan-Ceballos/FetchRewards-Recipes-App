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
    
    public var mealNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.contentMode = .center
        label.numberOfLines = 0
        label.textColor = .systemBackground
        return label
    }()
    
    public var mealImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
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
        setupCategoryImageViewConstraints()
        setupmealNameLabelConstraints()
    }
    
    private func setupCategoryImageViewConstraints() {
        let heightMultiplier: CGFloat = 0.6
        addSubview(mealImageView)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mealImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: heightMultiplier),
            mealImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setupmealNameLabelConstraints() {
        addSubview(mealNameLabel)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealNameLabel.topAnchor.constraint(equalTo: self.mealImageView.bottomAnchor, constant: padding),
            mealNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            mealNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        ])
    }
    
}
