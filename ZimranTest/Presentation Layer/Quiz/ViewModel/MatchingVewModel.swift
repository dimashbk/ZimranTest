//
//  MatchingVewModel.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 11.04.2023.
//

import UIKit
import Foundation

struct ButtonsOrdering {
    var imageButton: MatchingButton?
    var labelButton: MatchingButton?
}

final class MatchingViewModel {
    
    var correctAnswer = String()
    
    var correctMatchCount = 0
    
    var buttons = [MatchingButton]()
    
    func getResult(buttons: ButtonsOrdering) -> Bool {
        if buttons.imageButton?.choise?.ordering == buttons.labelButton?.choise?.ordering {
            correctMatchCount += 1
            return true
        }
        return false
    }
    
    func getCorretness() -> Bool {
        if correctMatchCount == 5 {
            correctAnswer = "Good Job!"
            return true
        } else {
            correctAnswer = "Try again"
            return false
        }
    }
}
