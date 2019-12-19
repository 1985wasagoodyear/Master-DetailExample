//
//  MasterDetailFactory.swift
//  MasterDetailExample
//
//  Created by K Y on 7/19/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit

public enum MasterDetailFactory {
    public static func create(_ master: SplitMasterProtocol,
                              _ detail: SplitDetailProtocol) -> MasterDetailSplitProtocol {
        let vc: MasterDetailSplitProtocol = MasterDetailSplitViewController(master, detail)
        return vc
    }
    
}

public class MasterDetailSplitViewController: UISplitViewController, MasterDetailSplitProtocol {
    
    // MARK: - UIViewController Properties
    
    var masterNav: UINavigationController!
    var detailNav: UINavigationController!
    public var masterViewController: SplitMasterProtocol!
    public var detailViewController: SplitDetailProtocol!
    
    // MARK: - Initializers
    
    required public init(_ master: SplitMasterProtocol, _ detail: SplitDetailProtocol) {
        super.init(nibName: nil, bundle: nil)
        setup(master, detail)
        navigationItem.leftBarButtonItem = displayModeButtonItem
        delegate = self
        preferredDisplayMode = .allVisible
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    // MARK: - Helper Function for Setup
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
    }
    
    // MARK: - Methods
    
    public func showDetailViewController() {
        guard let detailVC = detailViewController else { return }
        showDetailViewController(detailVC, sender: nil)
    }
    
}

extension MasterDetailSplitViewController: UISplitViewControllerDelegate {
    
    // avoid default behavior to show detail-first
    public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
}
