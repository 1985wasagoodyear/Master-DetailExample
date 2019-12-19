//
//  AppDelegate.swift
//  MasterDetailExample
//
//  Created by Kevin Yu on 2/27/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = startingVC()
        window?.makeKeyAndVisible()
        return true
    }
    
    func startingVC() -> UIViewController {
        return ProgrammaticSample.start()
    }

}

