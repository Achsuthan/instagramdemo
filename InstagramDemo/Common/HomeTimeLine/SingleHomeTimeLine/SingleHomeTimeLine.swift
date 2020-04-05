//
//  SingleHomeTimeLine.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/7/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class SingleHomeTimeLine: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    
    
    let timeLineuserDetails: TimeLineUserDetailsBar = {
        let view = TimeLineUserDetailsBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineView: LineView = {
        let view =  LineView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineView1: LineView = {
        let view =  LineView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let singleLargeImage: SingleLargeImageView = {
        let image = SingleLargeImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let storyOption: StoryOption = {
        let view = StoryOption()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let postDetails: PostDetailsView = {
        let view = PostDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var navigation: UINavigationController? {
        didSet{
            timeLineuserDetails.navigation = navigation
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //        self.setUp()
    }
    
    var index: Int? {
        didSet {
            self.setUp()
        }
    }
    
    var storyCollectionView: UICollectionView?
    
    
    
    
    private func setUp(){
        
        if(self.index == 0 ){
            
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            storyCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
            storyCollectionView?.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(storyCollectionView!)
            storyCollectionView?.delegate = self
            storyCollectionView?.dataSource = self
            if let layout = storyCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
            storyCollectionView?.showsHorizontalScrollIndicator = false
            storyCollectionView?.register(UINib(nibName: "SingleStory", bundle: nil), forCellWithReuseIdentifier: "SingleStory")
            storyCollectionView?.backgroundColor = .white
            storyCollectionView?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            storyCollectionView?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            storyCollectionView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            storyCollectionView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        }
        else {
            self.storyCollectionView?.removeFromSuperview()
            self.addSubview(lineView)
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
            
            
            self.addSubview(timeLineuserDetails)
            timeLineuserDetails.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            timeLineuserDetails.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            timeLineuserDetails.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            timeLineuserDetails.heightAnchor.constraint(equalToConstant: 55).isActive = true
            
            
            self.addSubview(lineView1)
            lineView1.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            lineView1.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            lineView1.topAnchor.constraint(equalTo: self.timeLineuserDetails.bottomAnchor, constant: 4.5).isActive = true
            lineView1.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
            
            
            self.addSubview(singleLargeImage)
            singleLargeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            singleLargeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
            singleLargeImage.topAnchor.constraint(equalTo: self.lineView1.bottomAnchor, constant: 0).isActive = true
            singleLargeImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
            
            let gesture  = UITapGestureRecognizer(target: self, action: #selector(self.btClickImage(_:)))
            singleLargeImage.addGestureRecognizer(gesture)
            
            self.addSubview(storyOption)
            storyOption.navigation = self.navigation
            storyOption.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            storyOption.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            storyOption.topAnchor.constraint(equalTo: self.singleLargeImage.bottomAnchor, constant: 5).isActive = true
            storyOption.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            self.addSubview(postDetails)
            postDetails.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            postDetails.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            postDetails.topAnchor.constraint(equalTo: self.storyOption.bottomAnchor, constant: 5).isActive = true
            postDetails.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
        }
        
    }
    
    @IBAction func btClickImage(_: Any){
        print("Bt Image click action")
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(identifier: "LikesViewController") as! LikesViewController
        self.navigation?.pushViewController(view, animated: true)
    }
}
