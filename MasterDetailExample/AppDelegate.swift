//
//  AppDelegate.swift
//  MasterDetailExample
//
//  Created by Kevin Yu on 2/27/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit
import MasterDetailFactory

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
        return MasterDetailFactory.create(MasterSample(),
                                          DetailSample())
    }

}

class DetailSample: UIViewController, SplitDetailProtocol {
    var masterViewController: SplitMasterProtocol?
    
    func receive(_ datum: Int) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}

class MasterSample: UIViewController, SplitMasterProtocol {
    var detailViewController: SplitDetailProtocol?
    
    func receive(_ datum: Int) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
}
