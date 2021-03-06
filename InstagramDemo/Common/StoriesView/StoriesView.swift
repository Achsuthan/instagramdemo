//
//  StoriesView.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/7/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class StoriesView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleStory", for: indexPath) as! SingleStory
        view.index = indexPath.row
        view.name = "Achsuthan Mahendran"
        
        return view
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let storyCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        storyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(storyCollectionView)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        if let layout = storyCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        storyCollectionView.showsHorizontalScrollIndicator = false
        storyCollectionView.register(UINib(nibName: "SingleStory", bundle: nil), forCellWithReuseIdentifier: "SingleStory")
        storyCollectionView.backgroundColor = .white
        storyCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        storyCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        storyCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        storyCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
    }
    
}
