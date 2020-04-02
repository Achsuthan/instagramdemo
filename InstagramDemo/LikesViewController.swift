//
//  LikesViewController.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 4/2/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "LikeDetails", for: indexPath) as! LikeDetails
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 90)
    }
    
    
    let profileNavigation: ProfileNavBar = {
        let view = ProfileNavBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let txtSearch: UISearchTextField = {
        let searchInput  = UISearchTextField()
        searchInput.translatesAutoresizingMaskIntoConstraints = false
        searchInput.placeholder = "Search..."
        return searchInput
    }()
    
    let lineView: LineView = {
        let line = LineView()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    private func setUp(){
        
        //Need to configure the title of the navigation and buttons
        self.view.addSubview(profileNavigation)
        profileNavigation.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileNavigation.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        profileNavigation.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        profileNavigation.heightAnchor.constraint(equalToConstant: 55).isActive = true
        profileNavigation.navigation = self.navigationController
        
        //Line View
        self.view.addSubview(self.lineView)
        self.lineView.topAnchor.constraint(equalTo: self.profileNavigation.bottomAnchor).isActive  = true
        self.lineView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.lineView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.view.addSubview(self.txtSearch)
        self.txtSearch.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        self.txtSearch.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        self.txtSearch.topAnchor.constraint(equalTo: self.lineView.bottomAnchor, constant: 10).isActive = true
        self.txtSearch.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        let layout = UICollectionViewFlowLayout()
        let likeCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        likeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(likeCollectionView)
        likeCollectionView.delegate = self
        likeCollectionView.dataSource = self
        if let layout = likeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        likeCollectionView.showsVerticalScrollIndicator = false
        likeCollectionView.register(UINib(nibName: "LikeDetails", bundle: nil), forCellWithReuseIdentifier: "LikeDetails")
        likeCollectionView.backgroundColor = .white
        likeCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        likeCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        likeCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        likeCollectionView.topAnchor.constraint(equalTo: self.txtSearch.bottomAnchor, constant: 10).isActive = true
    }
    
}
