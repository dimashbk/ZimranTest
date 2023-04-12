//
//  NetworkService.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 09.04.2023.
//

import Foundation

enum ObtainCourseResult{
    case success(posts: Course)
    case failure(error: Error)
}
enum fetchLessonResult{
    case success(posts: Lesson)
    case failure(error: Error)
}

final class NetworkService {
    let session = URLSession.shared
    
    let decoder = JSONDecoder()

    func obtainCourse(url: URL, accessToken: String ,completion: @escaping(ObtainCourseResult) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        session.dataTask(with: request) { [weak self] data, response, error in
            var result: ObtainCourseResult
            
            guard let strongSelf = self else { return }
            
            if let data = data, error == nil{
                guard let posts = try? strongSelf.decoder.decode( Course.self, from: data) else {
                    print(response as Any)
                    return }
               
                result = .success(posts: posts)
            }else{
                result = .failure(error: error!)

            }
            completion(result)
            
        }.resume()
    }
    func obtainLesson(url: URL, accessToken: String ,completion: @escaping(fetchLessonResult) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        print(url)
        session.dataTask(with: request) { [weak self] data, response, error in
            var result: fetchLessonResult
            
            guard let strongSelf = self else { return }
            
            if let data = data, error == nil{
                guard let posts = try? strongSelf.decoder.decode( Lesson.self, from: data) else {
                    print("no")
                    print(data)
                    print(response as Any)
                    return }
               
                result = .success(posts: posts)
            }else{
                result = .failure(error: error!)
                print("erorororor")
            }
            completion(result)
            
        }.resume()
    }
    func postCorrectness(url: URL, accessToken: String ,completion: @escaping(fetchLessonResult) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    }
    
}
