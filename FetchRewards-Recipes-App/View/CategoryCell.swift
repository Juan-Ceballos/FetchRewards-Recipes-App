//
//  CategoryCell.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/1/21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseIdentifier = "categoryCell"
    private let padding: CGFloat = 8
    
    public var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    public var categoryImageView: UIImageView = {
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
        setupCategoryLabelConstraints()
        setupCategoryImageViewConstraints()
    }
    
    private func setupCategoryLabelConstraints() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    private func setupCategoryImageViewConstraints() {
        let heightMultiplier: CGFloat = 0.7
        addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: padding),
            categoryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            categoryImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: heightMultiplier),
            categoryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
