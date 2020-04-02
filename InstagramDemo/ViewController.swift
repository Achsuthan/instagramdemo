//
//  ViewController.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/1/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let navBar: NavigationBar = {
        let nav = NavigationBar()
        nav.translatesAutoresizingMaskIntoConstraints = false
        return nav
    }()
    
    let storyView : StoriesView = {
        let view = StoriesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let homeTimeLineView : HomeTimeLine = {
        let view = HomeTimeLine()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Notification view need to set the height and width
    let notifcationView: NotificationView = {
        let view = NotificationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
           
        }
    }
    
    private func setUp(){
        self.view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        self.view.addSubview(navBar)
        navBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        navBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        navBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.setUpStoryView()
    }
    
    private func setUpStoryView(){
        self.view.addSubview(storyView)
        self.storyView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        self.storyView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.storyView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor).isActive = true
        self.storyView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        
        self.view.addSubview(homeTimeLineView)
        self.homeTimeLineView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        self.homeTimeLineView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.homeTimeLineView.topAnchor.constraint(equalTo: self.storyView.bottomAnchor).isActive = true
        self.homeTimeLineView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        homeTimeLineView.naviagation = self.navigationController
        
        
    }
    
    
}

