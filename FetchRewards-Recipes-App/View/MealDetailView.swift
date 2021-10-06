//
//  MealDetailView.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//

import UIKit

class MealDetailView: UIView {
    
    let padding: CGFloat = 8
    
    public var mealImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    //
    
    public var mealNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    public var mealInstrunctionsTextView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.preferredFont(forTextStyle: .body)
        return tv
    }()
    
    public var mealIngredientsMeasurementsTextView: UITextView = {
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
        setupCategoryImageViewConstraints()
        //setupmealNameLabelConstraints()
        setupMealInstructionsTextViewConstraints()
        setupInstructionsMeasurementsTextViewConstraints()
    }
    
    private func setupCategoryImageViewConstraints() {
        let heightMultiplier: CGFloat = 0.4
        addSubview(mealImageView)
        mealImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mealImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: heightMultiplier),
            mealImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setupmealNameLabelConstraints() {
        addSubview(mealNameLabel)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mealNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            mealNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        ])
    }
    
    private func setupMealInstructionsTextViewConstraints() {
        let heightMultiplier: CGFloat = 0.2
        addSubview(mealInstrunctionsTextView)
        mealInstrunctionsTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealInstrunctionsTextView.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: padding),
            mealInstrunctionsTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealInstrunctionsTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mealInstrunctionsTextView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: heightMultiplier)
        ])
    }
    
    private func setupInstructionsMeasurementsTextViewConstraints() {
        let heightMultiplier: CGFloat = 0.1
        addSubview(mealIngredientsMeasurementsTextView)
        mealIngredientsMeasurementsTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealIngredientsMeasurementsTextView.topAnchor.constraint(equalTo: mealInstrunctionsTextView.bottomAnchor, constant: padding),
            mealIngredientsMeasurementsTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mealIngredientsMeasurementsTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mealIngredientsMeasurementsTextView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: heightMultiplier)
        ])
    }
    
}
