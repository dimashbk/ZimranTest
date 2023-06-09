//
//  QuizViewModel.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 08.04.2023.
//

import Foundation

final class QuizViewModel {
    
    var updateViewData: (() -> ())?
    
    let networkService = NetworkService()
    
    var lesson = [Lesson]()
    var topicId: String
    var lessonId: String
    var accessToken: String
    var userId: String
   
    init(topicId: String, lessonId: String, accessToken: String, userId: String) {
        self.topicId = topicId
        self.lessonId = lessonId
        self.accessToken = accessToken
        self.userId = userId
    }
    
    func fetchLesson() {
    
        let myUrl = URL(string: Constants.baseUrl + "/topics/\(topicId)/lessons/\(lessonId)/questions/?user_id=\(userId)")!
        print(myUrl)
        networkService.obtainLesson(url: myUrl,
                                    accessToken: accessToken) { [weak self] (result) in
            switch result{
            case .success(let posts):
                self?.lesson.append(posts)
                print(self?.lesson[0].questions.count as Any)
                self?.updateViewData?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
