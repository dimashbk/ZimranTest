//
//  GapFillViewModel.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 12.04.2023.
//

import Foundation

final class GapFillViewModel {
    
    var correctAnswer = [String]()
    
    var correctAnswerCount = 1
    

    func getCorrectAnswer(choises: [Choice]) {
        for i in 0...(choises.count - 1) {
                if choises[i].isCorrect && choises[i].ordering == correctAnswerCount{
                    correctAnswer.append(choises[i].text)
                    correctAnswerCount += 1
                }
        }
    }
    
    func getCorretness(answers: [String]) -> Bool {
        
        if correctAnswer == answers {
            print(answers)
            print(correctAnswer)
            return true
        } else {
            return false
        }
    }
    
}
