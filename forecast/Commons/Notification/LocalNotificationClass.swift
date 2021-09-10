//
//  LocalNotificationClass.swift
//  forecast
//
//  Created by Guru on 10/09/2021.
//  Copyright © 2021 SHAPE A/S. All rights reserved.
//

import UIKit

func createLocalNotification(desc:String){
    
    let content = UNMutableNotificationContent()
    content.title = NSString.localizedUserNotificationString(forKey: "Forecase App", arguments: nil)
    content.body = NSString.localizedUserNotificationString(forKey: desc, arguments: nil)
    content.sound = UNNotificationSound.default
    content.categoryIdentifier = "notify-test"
    let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 3, repeats: false)
    let request = UNNotificationRequest.init(identifier: "notify-test", content: content, trigger: trigger)
    let center = UNUserNotificationCenter.current()
    center.add(request)
}
