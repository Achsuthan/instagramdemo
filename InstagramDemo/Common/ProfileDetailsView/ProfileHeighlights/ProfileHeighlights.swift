//
//  ProfileHeighlights.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 4/1/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class ProfileHeighlights: UICollectionViewCell {
    
    let lblName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
    }
    
    private func setUp(){
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backgroundView)
        backgroundView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        backgroundView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backgroundView.layer.borderColor = UIColor.lightGray.cgColor
        backgroundView.layer.borderWidth = 2
        backgroundView.layer.cornerRadius = 30
        backgroundView.backgroundColor = .white
        
        let insideView  = UIView()
        insideView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(insideView)
        insideView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        insideView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        insideView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        insideView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        insideView.layer.borderWidth = 1
        insideView.backgroundColor = .red
        insideView.layer.borderColor = UIColor.lightGray.cgColor
        insideView.layer.cornerRadius = 25
        
        self.addSubview(self.lblName)
        self.lblName.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10).isActive = true
        self.lblName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        self.lblName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        self.lblName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.lblName.text = "New"
        
    }
    
}
