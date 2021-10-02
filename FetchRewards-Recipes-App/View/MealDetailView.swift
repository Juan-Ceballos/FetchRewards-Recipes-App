//
//  MealDetailView.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//

import UIKit

class MealDetailView: UIView {
    
    let padding: CGFloat = 8
    let ivHeightMultiplier: CGFloat = 0.4
    let tvHeightMultiplier: CGFloat = 0.2
    
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
    
    public var mealInstrunctionsTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.preferredFont(forTextStyle: .body)
        return tv
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
        setupMealInstructionsTextViewConstraints()
    }
    
    private func setupmealNameLabelConstraints() {
        addSubview(mealNameLabel)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            mealNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            mealNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func setupCategoryImageViewConstraints() {
        addSubview(mealImageView)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: padding),
            mealImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: ivHeightMultiplier),
            mealImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            mealImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        ])
    }
    
    private func setupMealInstructionsTextViewConstraints() {
        addSubview(mealInstrunctionsTextView)
        mealInstrunctionsTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealInstrunctionsTextView.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: padding),
            mealInstrunctionsTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealInstrunctionsTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mealInstrunctionsTextView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: tvHeightMultiplier)
        ])
    }
    
}
