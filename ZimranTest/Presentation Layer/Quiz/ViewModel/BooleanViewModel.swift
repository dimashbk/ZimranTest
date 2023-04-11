//
//  BooleanViewModel.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 11.04.2023.
//

import Foundation

final class BooleanViewModel {
    
    var correctAnswer = Bool()
    
    func getCorrectAnswer(choises: [Choice]) {
        if choises[0].text == "False" && choises[0].isCorrect {
            correctAnswer = false
        } else if choises[1].text == "False" && choises[1].isCorrect {
            correctAnswer = false
        } else {
            correctAnswer = true
        }
    }
    
}
