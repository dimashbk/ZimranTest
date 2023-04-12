//
//  SingleTextViewModel.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 11.04.2023.
//

final class SingleTextViewModel {
    
    var correctAnswer = String()
    
    func getCorrectAnswer(choises: [Choice]) {
        for i in 0...(choises.count - 1) {
            if choises[i].isCorrect {
                correctAnswer = choises[i].text
            }
        }
    }
    
    func getCorretness(chosenButton: SingleTextButton) -> Bool {
        if chosenButton.label.text == correctAnswer {
            correctAnswer = "Good Job"
            return true
        } else {
            return false
        }
    }
}
