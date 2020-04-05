//
//  StoryOption.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/8/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class StoryOption: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var navigation: UINavigationController?
    
    private func setUp(){
        let loveImage  = UIImageView()
        loveImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loveImage)
        loveImage.backgroundColor = .lightGray
        loveImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        loveImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        loveImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        loveImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        let commentImage = UIImageView()
        commentImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(commentImage)
        commentImage.backgroundColor = .lightGray
        commentImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        commentImage.leadingAnchor.constraint(equalTo: loveImage.trailingAnchor, constant: 15).isActive = true
        commentImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        commentImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.btComment(_:)))
        commentImage.addGestureRecognizer(gesture)
        
        let shareImage  = UIImageView()
        shareImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(shareImage)
        shareImage.backgroundColor = .lightGray
        shareImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        shareImage.leadingAnchor.constraint(equalTo: commentImage.trailingAnchor, constant: 15).isActive = true
        shareImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        shareImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        let saveStoryImage  = UIImageView()
        saveStoryImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(saveStoryImage)
        saveStoryImage.backgroundColor = .lightGray
        saveStoryImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        saveStoryImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        saveStoryImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saveStoryImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @IBAction func btComment(_: Any){
        print("Comment button clicked")
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(identifier: "CommentsViewController") as! CommentsViewController
        self.navigation?.pushViewController(view, animated: true)
    }
}
