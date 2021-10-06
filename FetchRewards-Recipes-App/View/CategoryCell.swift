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
        label.textColor = .systemBackground
        return label
    }()
    
    public lazy var backgroundImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    public var categoryImageView: UIImageView = {
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
        setupBackgroundImageView()
        setupCategoryImageViewConstraints()
        setupCategoryLabelConstraints()
    }
    
    private func setupBackgroundImageView() {
        addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupCategoryImageViewConstraints() {
        let widthMultiplier: CGFloat = 0.5
        addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: self.topAnchor),
            categoryImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            categoryImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: widthMultiplier),
            categoryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            categoryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupCategoryLabelConstraints() {
        let labelTrailingPadding: CGFloat = 22
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -labelTrailingPadding)
        ])
    }
}
