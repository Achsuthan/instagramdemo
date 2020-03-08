//
//  PostDetailsView.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/8/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class PostDetailsView: UIView {
    let roundImageView: RoundImageView = {
        let view = RoundImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let roundImageView1: RoundImageView = {
        let view = RoundImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let roundImageView2: RoundImageView = {
        let view = RoundImageView()
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
        let imageModel = RoundImageModel(viewHeight: 40, imageHeight: 40, borderColor: .white)
        self.addSubview(self.roundImageView2)
        self.addSubview(self.roundImageView1)
        self.addSubview(self.roundImageView)
        
        self.roundImageView.imageModel = imageModel
        self.roundImageView1.imageModel = imageModel
        self.roundImageView2.imageModel = imageModel
        
        roundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        roundImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        roundImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        roundImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        roundImageView1.leadingAnchor.constraint(equalTo: self.roundImageView.trailingAnchor, constant: -35).isActive = true
        roundImageView1.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        roundImageView1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        roundImageView1.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        roundImageView2.leadingAnchor.constraint(equalTo: self.roundImageView1.trailingAnchor, constant: -35).isActive = true
        roundImageView2.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        roundImageView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        roundImageView2.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        let textLikeView  = UITextView()
        
        let like  = NSAttributedString(string: "Liked By ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        let lastPerson = NSAttributedString(string: "Achsuthan", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        let and = NSAttributedString(string: " and ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        
        let total = NSAttributedString(string: " 102 Others ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        
        let totalText = NSMutableAttributedString()
        totalText.append(like)
        totalText.append(lastPerson)
        totalText.append(and)
        totalText.append(total)
        
        textLikeView.attributedText = totalText
        textLikeView.isSelectable = false
        textLikeView.isEditable = false
        textLikeView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textLikeView)
        textLikeView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        textLikeView.leadingAnchor.constraint(equalTo: self.roundImageView2.trailingAnchor, constant: 5).isActive = true
        textLikeView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        textLikeView.heightAnchor.constraint(equalTo: self.roundImageView2.heightAnchor, multiplier: 1).isActive = true
        textLikeView.centerYAnchor.constraint(equalTo: self.roundImageView2.centerYAnchor).isActive = true
        
        let textDetailsView = UITextView()
        
        let name  = NSAttributedString(string: "Achsuthan Mahendran ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black , NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        let status = NSAttributedString(string: "Somewhere under blue sky", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
        let totalText1 = NSMutableAttributedString()
        totalText1.append(name)
        totalText1.append(status)
        
        textDetailsView.attributedText = totalText1
        textDetailsView.isSelectable = false
        textDetailsView.isEditable = false
        textDetailsView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textDetailsView)
        textDetailsView.topAnchor.constraint(equalTo: roundImageView2.bottomAnchor, constant: -5).isActive = true
        textDetailsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        textDetailsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        textDetailsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
    }
}
