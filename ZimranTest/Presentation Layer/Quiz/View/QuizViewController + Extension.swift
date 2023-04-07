//
//  QuizViewController + Extension.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 06.04.2023.
//

import UIKit

extension QuizViewController: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleMediaCollectionViewCell.description(), for: indexPath) as? SingleMediaCollectionViewCell else { return UICollectionViewCell() }
        
        switch indexPath.row {
        case 0:
            viewCell.backgroundColor = .white
            viewCell.textLabel.text = "InRoad"
        case 1:
            viewCell.backgroundColor = .brown
            viewCell.textLabel.text = "Приложение фиксирует неровности на дорогах с использованием данных акселерометра смартфона и привязкой к геолокации"
        case 2:
            viewCell.backgroundColor = .darkGray
            viewCell.textLabel.text = "Для корректной работы приложения разрешите доступ к использованию данных о геолокации и акселерометра"
        default:
            viewCell.backgroundColor = .clear
        }
        
        return viewCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 32, height: 520)
        
    }

}
