//
//  MainNavigationController.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/1/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        self.pushViewController(ViewController(), animated: true)
    }
}
