//
//  DetailViewController.swift
//  MasterDetailExample
//
//  Created by Kevin Yu on 2/27/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet private var imageView: UIImageView!
    
    var itemType: ItemTypes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
    }
    
    private func setupImage() {
        if let name = itemType?.rawValue {
            imageView.image = UIImage(named: name)
        }
    }

}

