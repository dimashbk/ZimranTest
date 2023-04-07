//
//  AppDelegate.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 04.04.2023.
//

import UIKit
import Amplify
import AWSCognitoAuthPlugin


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: QuizViewController())
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        configureAmplify()
        
        return true
    }
    
    private func configureAmplify() {
        do {
               try Amplify.add(plugin: AWSCognitoAuthPlugin())
               try Amplify.configure()
               print("Amplify configured with auth plugin")
           } catch {
               print("Failed to initialize Amplify with \(error)")
           }
    }
}

