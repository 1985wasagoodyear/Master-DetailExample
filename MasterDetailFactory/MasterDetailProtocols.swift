//
//  MasterDetailProtocols.swift
//  MasterDetailFactory
//
//  Created by K Y on 12/19/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit

/// For use by a Master, like some table of settings
public protocol SplitMasterProtocol: UIViewController {
    var masterSplitViewController: MasterDetailSplitViewController! { get set }
    var detailViewController: SplitDetailProtocol! { get set }
}

/// For use by a Details page, like some additional-details page of a setting
public protocol SplitDetailProtocol: UIViewController {
    var masterSplitViewController: MasterDetailSplitViewController! { get set }
    var masterViewController: SplitMasterProtocol! { get set }
    var datum: Any? { get set }
}

/// SplitViewController protocol to manage a SplitMasterProtocol and SplitDetailProtocol
public protocol MasterDetailSplitProtocol: UISplitViewController {
    var masterViewController: SplitMasterProtocol! { get set }
    var detailViewController: SplitDetailProtocol! { get set }
    init(_ master: SplitMasterProtocol,
         _ detail: SplitDetailProtocol)
    func showDetailViewController()
}

