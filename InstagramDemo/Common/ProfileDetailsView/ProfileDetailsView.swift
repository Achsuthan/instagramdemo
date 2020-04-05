//
//  ProfileDetailsView.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/9/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class ProfileDetailsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileHeighlights", for: indexPath) as! ProfileHeighlights
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
    
    
    let roundImage: RoundImageView = {
        let view = RoundImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lblUsername: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lblUserbio: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let btUrl: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        print("Set up")
        //setup the round image for user's profile
        self.addSubview(self.roundImage)
        let imageModel = RoundImageModel(viewHeight: 100, imageHeight: 94, borderColor: .red)
        self.roundImage.imageModel = imageModel
        self.roundImage.index = 0
        roundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        roundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        roundImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        roundImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        //Stack view for posts flowers and following
        let postView = UIView()
        postView.translatesAutoresizingMaskIntoConstraints = false
        
        let flowersView  = UIView()
        flowersView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let flowingView = UIView()
        flowingView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [postView, flowersView, flowingView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        stackView.leadingAnchor.constraint(equalTo: self.roundImage.trailingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.roundImage.heightAnchor, multiplier: 1).isActive = true
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        //TextView for post
        let postTextView = UITextView()
        postTextView.translatesAutoresizingMaskIntoConstraints = false
        postTextView.isEditable = false
        postTextView.isSelectable  = false
        postTextView.isScrollEnabled = false
        postView.addSubview(postTextView)
        postTextView.textAlignment = .center
        
        postTextView.centerYAnchor.constraint(equalTo: postView.centerYAnchor).isActive  = true
        postTextView.centerXAnchor.constraint(equalTo: postView.centerXAnchor).isActive  = true
        postTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        postTextView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        var countString  = NSAttributedString(string: "54\n", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.paragraphStyle: style])
        var details = NSAttributedString(string: "Post", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.paragraphStyle: style])
        
        var total = NSMutableAttributedString()
        total.append(countString)
        total.append(details)
        postTextView.attributedText = total
        
        //TextView for followers
        let flowersTextView = UITextView()
        flowersTextView.translatesAutoresizingMaskIntoConstraints = false
        flowersTextView.isEditable = false
        flowersTextView.isSelectable  = false
        flowersTextView.isScrollEnabled = false
        flowersView.addSubview(flowersTextView)
        flowersTextView.textAlignment = .center
        
        flowersTextView.centerYAnchor.constraint(equalTo: flowersView.centerYAnchor).isActive  = true
        flowersTextView.centerXAnchor.constraint(equalTo: flowersView.centerXAnchor).isActive  = true
        flowersTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        flowersTextView.widthAnchor.constraint(equalTo: flowersView.widthAnchor) .isActive = true
        
        countString  = NSAttributedString(string: "54\n", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),NSAttributedString.Key.paragraphStyle: style])
        details = NSAttributedString(string: "Followers", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.paragraphStyle: style])
        
        total = NSMutableAttributedString()
        total.append(countString)
        total.append(details)
        flowersTextView.attributedText = total
        
        //TextView for Flowing
        let flowingTextView = UITextView()
        flowingTextView.translatesAutoresizingMaskIntoConstraints = false
        flowingTextView.isEditable = false
        flowingTextView.isSelectable  = false
        flowingTextView.isScrollEnabled = false
        flowingView.addSubview(flowingTextView)
        flowingTextView.textAlignment = .center
        
        flowingTextView.centerYAnchor.constraint(equalTo: flowingView.centerYAnchor).isActive  = true
        flowingTextView.centerXAnchor.constraint(equalTo: flowingView.centerXAnchor).isActive  = true
        flowingTextView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        flowingTextView.widthAnchor.constraint(equalTo: flowingView.widthAnchor) .isActive = true
        
        countString  = NSAttributedString(string: "54\n", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.paragraphStyle: style])
        details = NSAttributedString(string: "Following", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.paragraphStyle: style])
        
        total = NSMutableAttributedString()
        total.append(countString)
        total.append(details)
        flowingTextView.attributedText = total
        
        //User's name label
        self.addSubview(self.lblUsername)
        self.lblUsername.topAnchor.constraint(equalTo: self.roundImage.bottomAnchor, constant: 5).isActive = true
        self.lblUsername.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.lblUsername.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.lblUsername.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.lblUsername.text = "Achsuthan Mahendran"
        
        //Userbio
        self.addSubview(self.lblUserbio)
        self.lblUserbio.topAnchor.constraint(equalTo: self.lblUsername.bottomAnchor, constant: 0).isActive = true
        self.lblUserbio.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.lblUserbio.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.lblUserbio.text = "Lorem ipsum dolor sit amet."
        
        //Button for URL
        self.addSubview(btUrl)
        self.btUrl.topAnchor.constraint(equalTo: self.lblUserbio.bottomAnchor, constant: -5).isActive = true
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
            layout.scrollDirection = .horizontal
        }
        heiglightsCollectionView.showsVerticalScrollIndicator = false
        heiglightsCollectionView.showsHorizontalScrollIndicator = false
        heiglightsCollectionView.register(UINib(nibName: "ProfileHeighlights", bundle: nil), forCellWithReuseIdentifier: "ProfileHeighlights")
        
        //Story collection view
        self.addSubview(heiglightsCollectionView)
        heiglightsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        heiglightsCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        heiglightsCollectionView.topAnchor.constraint(equalTo: btEditProfile.bottomAnchor, constant: 10).isActive = true
        heiglightsCollectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        heiglightsCollectionView.backgroundColor = .white
        
        //LineView
        let lineView  = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: heiglightsCollectionView.bottomAnchor, constant: 10).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lineView.backgroundColor = .lightGray
        
        //OptionView
        let postsView = UIView()
        postsView.translatesAutoresizingMaskIntoConstraints = false
        
        let tagsView = UIView()
        tagsView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView2 = UIStackView(arrangedSubviews: [postsView, tagsView])
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView2)
        stackView2.topAnchor.constraint(equalTo: lineView.bottomAnchor).isActive = true
        stackView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView2.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView2.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView2.distribution = .fillEqually
        stackView2.axis = .horizontal
        
        
        //postsImageView
        let postsImageView  = UIImageView()
        postsImageView.translatesAutoresizingMaskIntoConstraints = false
        postsView.addSubview(postsImageView)
        postsImageView.backgroundColor = .lightGray
        postsImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        postsImageView.widthAnchor.constraint(equalToConstant: 40).isActive  = true
        postsImageView.topAnchor.constraint(equalTo: postsView.topAnchor, constant: 5).isActive = true
        postsImageView.centerXAnchor.constraint(equalTo: postsView.centerXAnchor).isActive = true
        
        
        
        //tagsImageView
        let tagsImageView  = UIImageView()
        tagsImageView.translatesAutoresizingMaskIntoConstraints = false
        tagsView.addSubview(tagsImageView)
        tagsImageView.backgroundColor = .lightGray
        tagsImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tagsImageView.widthAnchor.constraint(equalToConstant: 40).isActive  = true
        tagsImageView.topAnchor.constraint(equalTo: tagsView.topAnchor, constant: 5).isActive = true
        tagsImageView.centerXAnchor.constraint(equalTo: tagsView.centerXAnchor).isActive = true
        
        //LineView
        let lineView2  = UIView()
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView2)
        lineView2.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 0).isActive = true
        lineView2.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lineView2.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineView2.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lineView2.backgroundColor = .lightGray
        
        let bottomConstant = lineView2.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        bottomConstant.isActive = true
        
        self.addSubview(self.underLineView)
        self.underLineView.topAnchor.constraint(equalTo: stackView2.bottomAnchor).isActive = true
        self.underLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        self.underLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.underLineView.widthAnchor.constraint(equalTo: stackView2.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    @IBAction func btUrlAction(_: Any){
        print("Bt Url button clicked")
        
    }
    
    @IBAction func btEditProfileAction(_: Any){
        print("Bt edit profile action")
    }
}
