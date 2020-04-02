//
//  ProfileInformationView.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 4/2/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class ProfileInformation: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileHeighlights", for: indexPath) as! ProfileHeighlights
        return view
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    let btUrl: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        self.addSubview(btUrl)
        self.btUrl.topAnchor.constraint(equalTo: self.topAnchor, constant: -5).isActive = true
        self.btUrl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.btUrl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.btUrl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.btUrl.setTitleColor(.blue, for: .normal)
        self.btUrl.contentHorizontalAlignment = .left
        self.btUrl.setTitle("www.facebook.com/achsuthan", for: .normal)
        self.btUrl.addTarget(self, action: #selector(self.btUrlAction(_:)), for: .touchUpInside)
        
        
        //Edit Profile view
        let editView = UIView()
        editView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(editView)
        editView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        editView.topAnchor.constraint(equalTo: self.btUrl.bottomAnchor, constant: 0).isActive = true
        editView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        editView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        editView.layer.borderColor = UIColor.gray.cgColor
        editView.layer.cornerRadius = 5
        editView.layer.borderWidth = 0.5
        
        //Edit profile button
        let btEditProfile = UIButton()
        btEditProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(btEditProfile)
        btEditProfile.leadingAnchor.constraint(equalTo: editView.leadingAnchor).isActive = true
        btEditProfile.trailingAnchor.constraint(equalTo: editView.trailingAnchor).isActive = true
        btEditProfile.topAnchor.constraint(equalTo: editView.topAnchor).isActive = true
        btEditProfile.bottomAnchor.constraint(equalTo: editView.bottomAnchor).isActive = true
        btEditProfile.setTitleColor(.black, for: .normal)
        btEditProfile.setTitle("Edit Profile", for: .normal)
        btEditProfile.addTarget(self, action: #selector(self.btEditProfileAction(_:)), for: .touchUpInside)
        
        //Heightlight collectionView
        let layout = UICollectionViewFlowLayout()
        let heiglightsCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        heiglightsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        heiglightsCollectionView.delegate = self
        heiglightsCollectionView.dataSource = self
        if let layout = heiglightsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        heiglightsCollectionView.showsVerticalScrollIndicator = false
        heiglightsCollectionView.register(UINib(nibName: "ProfileHeighlights", bundle: nil), forCellWithReuseIdentifier: "ProfileHeighlights")
        
        self.addSubview(heiglightsCollectionView)
        heiglightsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        heiglightsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        heiglightsCollectionView.topAnchor.constraint(equalTo: btEditProfile.bottomAnchor, constant: 10).isActive = true
        heiglightsCollectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        let bottomConstant = heiglightsCollectionView.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: 20)
        bottomConstant.isActive = true
        heiglightsCollectionView.backgroundColor = .red
    }
    
    @IBAction func btUrlAction(_: Any){
        print("Bt Url button clicked")
        
    }
    
    @IBAction func btEditProfileAction(_: Any){
        print("Bt edit profile action")
    }
}
