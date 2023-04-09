//
//  LessonModel.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 09.04.2023.
//

import Foundation

// MARK: - Lesson
struct Lesson: Codable {
    let lessonPosition: Int
    let title: String
    let questions: [Question]

    enum CodingKeys: String, CodingKey {
        case lessonPosition = "lesson_position"
        case title, questions
    }
}

// MARK: - Question
struct Question: Codable {
    let id, text: String
    let image: String
    let type: String
    let hints: Hints
    let showAfter: Bool
    let positiveText, negativeText: String
    let isActive: Bool
    let choices: [Choice]

    enum CodingKeys: String, CodingKey {
        case id, text, image, type, hints
        case showAfter = "show_after"
        case positiveText = "positive_text"
        case negativeText = "negative_text"
        case isActive = "is_active"
        case choices
    }
}

// MARK: - Choice
struct Choice: Codable {
    let id, text: String
    let image: String
    let isCorrect: Bool
    let ordering: Int

    enum CodingKeys: String, CodingKey {
        case id, text, image
        case isCorrect = "is_correct"
        case ordering
    }
}

// MARK: - Hints
struct Hints: Codable {
}
