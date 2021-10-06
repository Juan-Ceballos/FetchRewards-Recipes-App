//
//  MealDetailView.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//

import UIKit

class MealDetailView: UIView {
    
    let padding: CGFloat = 8
    let detailPadding: CGFloat = 11
    let roundRadius: CGFloat = 8
    let numOfLines = 0
    
    override func layoutSubviews() {
        detailsView.layer.cornerRadius = roundRadius
    }
    
    public var mealImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    public var detailsView: UIView = {
        let dv = UIView()
        dv.backgroundColor = .systemBackground
        return dv
    }()
    
    public lazy var mealNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = numOfLines
        return label
    }()
    
    public var mealInstrunctionsTextView: UITextView = {
        let tv = UITextView()
        tv.textColor = .systemGray
        tv.font = UIFont.preferredFont(forTextStyle: .footnote)
        tv.isEditable = false
        tv.isSelectable = false
        return tv
    }()
    
    public var materialsLabel: UILabel = {
        let label = UILabel()
        label.text = "Materials"
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    public var mealIngredientsMeasurementsTextView: UITextView = {
        let tv = UITextView()
        tv.textColor = .systemGray
        tv.font = UIFont.preferredFont(forTextStyle: .footnote)
        tv.isEditable = false
        tv.isSelectable = false
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
        setupDetailsViewConstraints()
        setupmealNameLabelConstraints()
        setupMealInstructionsTextViewConstraints()
        setupMaterialsLabelConstraints()
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
    
    private func setupDetailsViewConstraints() {
        addSubview(detailsView)
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: mealImageView.bottomAnchor, constant: padding),
            detailsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            detailsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            detailsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
    
    private func setupmealNameLabelConstraints() {
        addSubview(mealNameLabel)
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealNameLabel.topAnchor.constraint(equalTo: detailsView.topAnchor, constant: padding),
            mealNameLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: detailPadding),
            mealNameLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -detailPadding)
        ])
    }
    
    private func setupMealInstructionsTextViewConstraints() {
        let heightMultiplier: CGFloat = 0.2
        addSubview(mealInstrunctionsTextView)
        mealInstrunctionsTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealInstrunctionsTextView.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: padding),
            mealInstrunctionsTextView.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: padding),
            mealInstrunctionsTextView.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -padding),
            mealInstrunctionsTextView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: heightMultiplier)
        ])
    }
    
    private func setupMaterialsLabelConstraints() {
        addSubview(materialsLabel)
        materialsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            materialsLabel.topAnchor.constraint(equalTo: mealInstrunctionsTextView.bottomAnchor, constant: padding),
            materialsLabel.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: detailPadding),
            materialsLabel.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -padding)
        ])
    }
    
    private func setupInstructionsMeasurementsTextViewConstraints() {
        let heightMultiplier: CGFloat = 0.1
        addSubview(mealIngredientsMeasurementsTextView)
        mealIngredientsMeasurementsTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealIngredientsMeasurementsTextView.topAnchor.constraint(equalTo: materialsLabel.bottomAnchor, constant: padding),
            mealIngredientsMeasurementsTextView.leadingAnchor.constraint(equalTo: detailsView.leadingAnchor, constant: padding),
            mealIngredientsMeasurementsTextView.trailingAnchor.constraint(equalTo: detailsView.trailingAnchor, constant: -detailPadding),
            mealIngredientsMeasurementsTextView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: heightMultiplier),
            mealIngredientsMeasurementsTextView.bottomAnchor.constraint(equalTo: detailsView.bottomAnchor, constant: -padding)
        ])
    }
    
}
