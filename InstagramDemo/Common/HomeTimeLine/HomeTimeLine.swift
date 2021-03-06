//
//  HomeTimeLine.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/7/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class HomeTimeLine: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleHomeTimeLine", for: indexPath) as! SingleHomeTimeLine
        view.navigation = self.naviagation
        view.index = indexPath.row
        return view
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.row == 0){
            return CGSize(width: self.frame.width, height: 80)
        }
        else {
            return CGSize(width: self.frame.width, height: 400)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
       NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            self.setUp()
        } else {
            print("Portrait")
            self.setUp()
        }
    }

    
    var naviagation: UINavigationController?
    
    
    private func setUp(){
        let layout = UICollectionViewFlowLayout()
        let storyCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        storyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(storyCollectionView)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        if let layout = storyCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        storyCollectionView.showsVerticalScrollIndicator = false
        storyCollectionView.register(UINib(nibName: "SingleHomeTimeLine", bundle: nil), forCellWithReuseIdentifier: "SingleHomeTimeLine")
        storyCollectionView.backgroundColor = .white
        storyCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        storyCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        storyCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        storyCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
}
