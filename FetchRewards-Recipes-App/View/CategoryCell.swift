//
//  CategoryCell.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/1/21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseIdentifier = "categoryCell"
    
    public lazy var categoryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var categoryImageView: UIImageView = {
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
            categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    private func setupCategoryImageViewConstraints() {
        addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            categoryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            categoryImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            categoryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}
