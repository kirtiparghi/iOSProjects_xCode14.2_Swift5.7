//
//  AppDelegate.swift
//  DesignPattern_VIPER_Demo
//
//  Created by Kirti Parghi on 2023-01-09.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let liveNews = LiveNewsRouter.createModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = liveNews
        window?.makeKeyAndVisible()
        
        return true
    }
}

