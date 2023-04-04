//
//  AppDelegate.swift
//  ZimranTest
//
//  Created by Dinmukhamed on 04.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: SignInViewController())
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        return true
    }
    
}

