//
//  ProgrammaticSamples.swift
//  MasterDetailExample
//
//  Created by K Y on 12/19/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit
import MasterDetailFactory

/*
 
 This demonstrates usage of the MasterDetailFactory framework,
 for making UISplitViewControllers programmatically.

 */

// start function helper to begin work at the App Delegate.
enum ProgrammaticSample {
    static func start() -> UIViewController {
        return MasterDetailFactory.create(MasterSample(),
                                          DetailSample())
    }
}

class DetailSample: UIViewController, SplitDetailProtocol {
    
    var masterSplitViewController: MasterDetailSplitViewController!
    var masterViewController: SplitMasterProtocol!
    
    var datum: Any? {
        didSet {
            guard let c = datum as? UIColor else { return }
            view.backgroundColor = c
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}

class MasterSample: UIViewController, SplitMasterProtocol {
    
    var masterSplitViewController: MasterDetailSplitViewController!
    var detailViewController: SplitDetailProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        detailViewController?.datum = UIColor.green
        masterSplitViewController?.showDetailViewController()
    }
    
}
