//
//  ProfileViewController.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/9/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileNavigation: ProfileNavBar = {
        let view = ProfileNavBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileDetails: ProfileDetailsView = {
        let view = ProfileDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    private func setUp(){
        self.view.addSubview(profileNavigation)
        profileNavigation.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileNavigation.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        profileNavigation.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        profileNavigation.heightAnchor.constraint(equalToConstant: 55).isActive = true
        profileNavigation.navigation = self.navigationController
        
        self.view.addSubview(profileDetails)
        profileDetails.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        profileDetails.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        profileDetails.topAnchor.constraint(equalTo: self.profileNavigation.bottomAnchor).isActive = true
        let height = profileDetails.heightAnchor.constraint(greaterThanOrEqualToConstant: 100)
        height.isActive = true
        
        height.priority = UILayoutPriority(rawValue: 250);
        height.isActive = true;
    }
    
}
