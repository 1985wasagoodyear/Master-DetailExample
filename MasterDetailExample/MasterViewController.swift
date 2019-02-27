//
//  MasterViewController.swift
//  MasterDetailExample
//
//  Created by Kevin Yu on 2/27/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit

final class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // like UINavigationControllers, UIViewControllers have a property to their
        // containing UISplitViewController (that is also an Optional)
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.itemType = ItemTypes.allCases[indexPath.row]
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemTypes.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = ItemTypes.allCases[indexPath.row].rawValue
        return cell
    }

}

