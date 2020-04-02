//
//  ProfileNavBar.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/9/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class ProfileNavBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var navigation: UINavigationController?
    
    private func setUp(){
        
        //Left Image
        let leftImage = UIImageView()
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leftImage)
        
        leftImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        leftImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        leftImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        leftImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        leftImage.backgroundColor = .lightGray
        
        //Right Image
        let rightImage = UIImageView()
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(rightImage)
        
        rightImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        rightImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        rightImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        rightImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rightImage.backgroundColor = .lightGray
        
        
        
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        nameLabel.text = "Achsuthan Mahendran"
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 1
        
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        //Left Button
        let leftButton  = UIButton()
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(leftButton)
        
        leftButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        leftButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        leftButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        leftButton.addTarget(self, action: #selector(self.btBack(_:)), for: .touchUpInside)
        
    }
    
    @IBAction func btBack(_: Any){
        print("Back button pressed")
        self.navigation?.popViewController(animated: true)
    }
}
