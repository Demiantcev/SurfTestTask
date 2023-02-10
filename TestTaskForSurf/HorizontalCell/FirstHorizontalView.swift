//
//  FirstHorizontalView.swift
//  TestTaskForSurf
//
//  Created by Кирилл Демьянцев on 07.02.2023.
//

import UIKit

class FirstHorizontalView: UICollectionView {

    private let categoryLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        categoryLayout.minimumInteritemSpacing = 12
        categoryLayout.scrollDirection = .horizontal
        
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        allowsMultipleSelection = true
        
        delegate = self
        dataSource = self
        register(HorizontalCell.self, forCellWithReuseIdentifier: HorizontalCell.reuzeId)
    }
}
// MARK: - UICollectionViewDataSource
extension FirstHorizontalView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCell.reuzeId, for: indexPath) as? HorizontalCell else { return UICollectionViewCell() }
        cell.categoryLabel.text = nameCategoryArray[indexPath.item]
        return cell
    }
}
// MARK: - UICollectionViewDelegate
extension FirstHorizontalView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension FirstHorizontalView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryFont = UIFont(name: "Arial Bold", size: 14)
        let categoryAttributes = [NSAttributedString.Key.font : categoryFont as Any]
        let categoryWidth = nameCategoryArray[indexPath.item].size(withAttributes: categoryAttributes).width + 30

        return CGSize(width: categoryWidth,
               height: collectionView.frame.height)
    }
}

