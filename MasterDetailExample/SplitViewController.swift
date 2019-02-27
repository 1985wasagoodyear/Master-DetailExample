//
//  SplitViewController.swift
//  MasterDetailExample
//
//  Created by Kevin Yu on 2/27/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit

final class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    // Interface Builder scenes compile their appearance into code that is decoded by
    // the coder-init
    // Thus, this is the first point of execution
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let navigationController = viewControllers[viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = self.displayModeButtonItem
        self.delegate = self
    }
    
    // MARK: - Split view
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController:UIViewController,
                             onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.itemType == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }
}
