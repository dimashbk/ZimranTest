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
        if quizViewModel!.lesson.isEmpty {
            return 0
        } else {
            return quizViewModel!.lesson[0].questions.count
           
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let questions = quizViewModel!.lesson[0].questions[indexPath.row]
        
        switch questions.type {
        case "SINGLE_TEXT":
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleTextCollectionViewCell.description(), for: indexPath) as? SingleTextCollectionViewCell else { return UICollectionViewCell() }
            
            viewCell.configureCell(choises: questions.choices, questionText: questions.text)
            viewCell.getCorrectnessDelegate = self
            
            
            return viewCell
        case "SINGLE_MEDIA":
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleMediaCollectionViewCell.description(), for: indexPath) as? SingleMediaCollectionViewCell else { return UICollectionViewCell() }
            
            viewCell.configureCell(choises: questions.choices, questionText: questions.text)
            viewCell.getCorrectnessDelegate = self
            
                return viewCell
        case "BOOLEAN":
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BooleanCollectionViewCell.description(), for: indexPath) as? BooleanCollectionViewCell else { return UICollectionViewCell() }
            
            viewCell.configureCell(choises: questions.choices, questionText: questions.text, questionImage: questions.image)
            booleanViewModel.getCorrectAnswer(choises: questions.choices)
            
            return viewCell
        case "GAP_FILL":
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BooleanCollectionViewCell.description(), for: indexPath) as? BooleanCollectionViewCell else { return UICollectionViewCell() }
            return viewCell
        case "MATCHING":
            guard let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier:  MatchingCollectionViewCell.description(), for: indexPath) as?  MatchingCollectionViewCell else { return UICollectionViewCell() }
            
            viewCell.configureCell(choises: questions.choices, questionText: questions.text)
            viewCell.getCorrectnessDelegate = self
            
            return viewCell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 32, height: 520)
        
    }

}
