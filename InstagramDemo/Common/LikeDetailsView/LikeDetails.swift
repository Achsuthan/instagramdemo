//
//  LikeDetails.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 4/2/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class LikeDetails: UICollectionViewCell {
    
    let roundImage: RoundImageView = {
        let view = RoundImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
    }
    
    private func setUp(){
        self.addSubview(self.roundImage)
        let imageModel = RoundImageModel(viewHeight: 80, imageHeight: 70, borderColor: .red)
        self.roundImage.imageModel = imageModel
        self.roundImage.index = 1
        roundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        roundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        roundImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        roundImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        let followingView = UIView()
        followingView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(followingView)
        followingView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        followingView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        followingView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        followingView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        followingView.backgroundColor = .blue
        followingView.layer.cornerRadius = 5
        followingView.layer.borderColor = UIColor.lightGray.cgColor
        followingView.layer.borderWidth = 1
        
        let lblFollowing = UILabel()
        lblFollowing.translatesAutoresizingMaskIntoConstraints = false
        followingView.addSubview(lblFollowing)
        lblFollowing.centerXAnchor.constraint(equalTo: followingView.centerXAnchor).isActive = true
        lblFollowing.centerYAnchor.constraint(equalTo: followingView.centerYAnchor).isActive = true
        lblFollowing.text  = "Follow"
        lblFollowing.textColor = .white
        
        let lblName = UILabel()
        lblName.text = "__interrupt"
        lblName.translatesAutoresizingMaskIntoConstraints = false
        let lblNameDetails = UILabel()
        lblNameDetails.text = "Achsuthan"
        lblNameDetails.textColor = .lightGray
        lblNameDetails.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [lblName, lblNameDetails])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.leadingAnchor.constraint(equalTo: self.roundImage.trailingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: followingView.leadingAnchor, constant: -10).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.roundImage.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.roundImage.heightAnchor, multiplier: 0.5).isActive = true
        stackView.backgroundColor = .blue
        
        
    }
    
}
