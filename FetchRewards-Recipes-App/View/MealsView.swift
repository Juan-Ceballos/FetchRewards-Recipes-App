//
//  MealsView.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//

import UIKit

public enum MealSection: String, CaseIterable {
    case main
}

class MealsView: UIView {
    
    public lazy var cv: UICollectionView = {
        let layout = createLayout()
        let mainCV = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        mainCV.backgroundColor = .systemBackground
        return mainCV
    }()
    
    private func createLayout() -> UICollectionViewLayout {
        let itemInsets: CGFloat = 8
        let dimension: CGFloat = 1
        let groupInset: CGFloat = 0
        let groupHeightMultiplier: CGFloat = 0.3
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(dimension), heightDimension: .fractionalHeight(dimension))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInsets, leading: itemInsets, bottom: itemInsets, trailing: itemInsets)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(dimension), heightDimension: .fractionalHeight(groupHeightMultiplier))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: groupInset, leading: groupInset, bottom: groupInset, trailing: groupInset)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
        
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
      setupCVConstraints()
    }
    
    private func setupCVConstraints() {
        addSubview(cv)
        cv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cv.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cv.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cv.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
