//
//  HomeViewModel.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 09.04.2023.
//

import Foundation

struct Constants {
    static let baseUrl = "https://api.prosperi.academy/dev/courses-v2"
}

final class HomeViewModel {
    
    var callback: (() -> ())?

    let networkService = NetworkService()
    var course = [Course]()
    var accessToken: String
    var userId: String
    
    init(accessToken: String, userId: String) {
        self.accessToken = accessToken
        self.userId = userId
    }

    func fetchCourse() {
        let myUrl = URL(string: Constants.baseUrl + "/units/?user_id=\(userId)")!
    
        networkService.obtainCourse(url: myUrl,
                                    accessToken: accessToken) { [weak self] (result) in
            switch result{
            case .success(let posts):
                self?.course.append(posts)
                print(self?.course[0].units as Any)
                self?.callback?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
}
