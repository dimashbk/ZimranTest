//
//  QuizButton.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 07.04.2023.
//

import UIKit

enum ButtonStates {
    case rest
    case selected
    case correct
    case incorrect
}

protocol ButtonStateProtocol {
    func setOnClickButton(button: UIButton)
}
protocol SecondButtonStateProtocol {
    func setOnClickSecondButton(button: UIButton)
}

//class QuizButton: UIButton {
//
//    func changeState(state: ButtonStates) {
//
//        switch state {
//        case .rest:
//            backgroundColor = .white
//            layer.cornerRadius = 8
//            layer.borderWidth = 1
//            layer.borderColor = UIColor.zmGrayQuizChoises.cgColor
//            self.stateImageView.image = .init(named: "SingleTextNormal")
//        case .selected:
//            self.layer.borderWidth = 1.3
//            self.layer.borderColor = UIColor.zmPrimaryBlue.cgColor
//            self.backgroundColor = UIColor.zmSelectedQuizChoises
//            self.stateImageView.image = .init(named: "SingleTextSelected")
//        case .correct:
//            print("correct")
//        case .incorrect:
//            print("incorrect")
//        }
//
//    }
//}
