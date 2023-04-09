//
//  MainModel.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 07.04.2023.
//

import Foundation

// MARK: - Course
struct Course: Codable {
    let units: [Unit]
    let progress: [Progress]
}

// MARK: - Progress
struct Progress: Codable {
    let id, status: String
    let topics: [ProgressTopic]
}

// MARK: - ProgressTopic
struct ProgressTopic: Codable {
    let id, status: String
    let lessons: [PurpleLesson]
}

// MARK: - PurpleLesson(Progress)
struct PurpleLesson: Codable {
    let id, status: String
}

// MARK: - Unit
struct Unit: Codable {
    let id: String
    let position: Int
    let title: String
    let topics: [UnitTopic]
    let images: [String]
}

// MARK: - UnitTopic
struct UnitTopic: Codable {
    let id: String
    let position: Int
    let title: String
    let icon: String
    let lessons: [FluffyLesson]
    let lessonsAmount: Int

    enum CodingKeys: String, CodingKey {
        case id, position, title, icon, lessons
        case lessonsAmount = "lessons_amount"
    }
}

// MARK: - FluffyLesson(Lesson)
struct FluffyLesson: Codable {
    let id: String
    let position: Int
    let title: Title
}

enum Title: String, Codable {
    case lesson1 = "Lesson 1"
    case lesson2 = "Lesson 2"
    case lesson3 = "Lesson 3"
    case lesson4 = "Lesson 4"
}
