//
//  AppDelegate.swift
//  Todopp
//
//  Created by Mehmet Eroğlu on 9.04.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       // This print statement show the path that user default information saved folder.
//        print("UserDefaults Folder path: ", NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        // realm database directory
//        print(Realm.Configuration.defaultConfiguration.fileURL)
      
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm: \(error)")
        }
        
        return true
    }


}

