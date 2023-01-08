//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by Kirti Parghi on 2023-01-08.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnRequestPermissionTapped(_ sender: Any) {
        //Ask permission from user for sending notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func btnScheduleNotificationTapped(_ sender: Any) {
        //preparing notification content
        let content = UNMutableNotificationContent()
        content.title = "Let's learn swiftUI"
        content.subtitle = "Hunger for learning something new"
        content.sound = UNNotificationSound.default
        
        //set a duration to trigger notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //generating notification request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        //adding notification request to notificatino center queue
        UNUserNotificationCenter.current().add(request)
    }
}

