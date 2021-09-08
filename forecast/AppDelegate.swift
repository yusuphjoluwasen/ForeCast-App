//
//  AppDelegate.swift
//  forecast
//
//  Created by Jakob Vinther-Larsen on 19/02/2019.
//  Copyright © 2019 SHAPE A/S. All rights reserved.
//

import UIKit
import API

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.registerPush(forApp: application)
        let client = ForecastClient(appId: Constants.string.apiKey)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootController = FindLocationConfig.setup(api: client)
        rootController.navigationController?.isNavigationBarHidden = true
        
        window?.rootViewController = UINavigationController(rootViewController:  rootController)
        window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        
        return true
    }

}

// Conform to UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
           willPresent notification: UNNotification,
           withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler(.alert)
    }
    
    // MARK:- Register Push
    private func registerPush(forApp application : UIApplication){
    
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options:[.alert, .sound]) { (granted, error) in
            
            if granted {
//                DispatchQueue.main.async {
//                     self.showAlertz()
//                }
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            }
        }
    }
    
}

