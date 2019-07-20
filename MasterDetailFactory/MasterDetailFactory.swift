//
//  MasterDetailFactory.swift
//  MasterDetailExample
//
//  Created by K Y on 7/19/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit

public protocol SplitMasterProtocol: UIViewController {
    var masterSplitViewController: MasterDetailSplitViewController? { get set }
    var detailViewController: SplitDetailProtocol? { get set }
    func receive(_ datum: Int)
}


public protocol SplitDetailProtocol: UIViewController {
    var masterSplitViewController: MasterDetailSplitViewController? { get set }
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

public class MasterDetailSplitViewController: UISplitViewController, MasterDetailSplitProtocol {
    var masterViewController: SplitMasterProtocol?
    var masterNav: UINavigationController?
    
    var detailViewController: SplitDetailProtocol?
    var detailNav: UINavigationController?
    
    func setup(_ master: SplitMasterProtocol,
               _ detail: SplitDetailProtocol) {
        masterNav = UINavigationController(rootViewController: master)
        detailNav = UINavigationController(rootViewController: detail)
        master.detailViewController = detail
        master.masterSplitViewController = self
        detail.masterViewController = master
        detail.masterSplitViewController = self
        detail.navigationItem.leftItemsSupplementBackButton = true
        detail.navigationItem.leftBarButtonItem = displayModeButtonItem
        viewControllers = [masterNav, detailNav] as! [UIViewController]
        delegate = self
    }
    
}

extension MasterDetailSplitViewController: UISplitViewControllerDelegate { }
