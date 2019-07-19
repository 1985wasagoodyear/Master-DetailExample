//
//  MasterDetailFactory.swift
//  MasterDetailExample
//
//  Created by K Y on 7/19/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit

public protocol SplitMasterProtocol: UIViewController {
    var detailViewController: SplitDetailProtocol? { get set }
    func receive(_ datum: Int)
}


public protocol SplitDetailProtocol: UIViewController {
    var masterViewController: SplitMasterProtocol? { get set }
    func receive(_ datum: Int)
}

public protocol MasterDetailSplitProtocol: UISplitViewController {
    var masterViewController: SplitMasterProtocol? { get set }
    var detailViewController: SplitDetailProtocol? { get set }
}

public enum MasterDetailFactory {
    public static func create(_ master: SplitMasterProtocol,
                              _ detail: SplitDetailProtocol) -> MasterDetailSplitProtocol {
        let vc = MasterDetailSplitViewController()
        vc.setup(master, detail)
        return vc
    }
    
}

class MasterDetailSplitViewController: UISplitViewController, MasterDetailSplitProtocol {
    var masterViewController: SplitMasterProtocol?
    
    var detailViewController: SplitDetailProtocol?
    
    func setup(_ master: SplitMasterProtocol,
               _ detail: SplitDetailProtocol) {
        master.detailViewController = detail
        detail.masterViewController = master
        
        viewControllers = [master, detail]
        delegate = self
    }
    
}

extension MasterDetailSplitViewController: UISplitViewControllerDelegate {
    
}
