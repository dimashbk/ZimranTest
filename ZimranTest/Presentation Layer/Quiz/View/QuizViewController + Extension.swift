//
//  QuizViewController + Extension.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 06.04.2023.
//

import UIKit

extension QuizViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizViewModel!.arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleTextCollectionViewCell.description(), for: indexPath) as? SingleTextCollectionViewCell else { return UICollectionViewCell() }
            return viewCell
        case 1:
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleMediaCollectionViewCell.description(), for: indexPath) as? SingleMediaCollectionViewCell else { return UICollectionViewCell() }
            return viewCell
        case 2:
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BooleanCollectionViewCell.description(), for: indexPath) as? BooleanCollectionViewCell else { return UICollectionViewCell() }
            return viewCell
            
        case 3:
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier:  MatchingCollectionViewCell.description(), for: indexPath) as?  MatchingCollectionViewCell else { return UICollectionViewCell() }
            return viewCell
        case 4:
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier:  MatchingCollectionViewCell.description(), for: indexPath) as?  MatchingCollectionViewCell else { return UICollectionViewCell() }
            return viewCell
        case 5:
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleMediaCollectionViewCell.description(), for: indexPath) as? SingleMediaCollectionViewCell else { return UICollectionViewCell() }
            return viewCell
        default: 
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 32, height: 520)
        
    }

}
