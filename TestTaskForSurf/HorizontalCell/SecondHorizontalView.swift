//
//  SecondHorizontalView.swift
//  TestTaskForSurf
//
//  Created by Кирилл Демьянцев on 07.02.2023.
//

import UIKit

class SecondHorizontalView: UICollectionView {
    
    private let categoryLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: createCompositionalLayout())
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        register(HorizontalCell.self, forCellWithReuseIdentifier: HorizontalCell.reuzeId)
        selectItem(at: [0,0], animated: true, scrollPosition: [])
    }
}
// MARK: - UICollectionViewDataSource
extension SecondHorizontalView: UICollectionViewDataSource {
    
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
extension SecondHorizontalView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}

