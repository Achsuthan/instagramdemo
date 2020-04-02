//
//  TimeLineUserDetailsBar.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/8/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class TimeLineUserDetailsBar: UIView {
    
    let roundImageView: RoundImageView = {
        let view = RoundImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var navigation: UINavigationController?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        self.addSubview(self.roundImageView)
        let imageModel = RoundImageModel(viewHeight: 50, imageHeight: 40, borderColor: .red)
        self.roundImageView.imageModel = imageModel
        roundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        roundImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        roundImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        roundImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        let profileButton = UIButton()
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileButton)
        
        profileButton.heightAnchor.constraint(equalTo: self.roundImageView.heightAnchor, multiplier: 1).isActive = true
        profileButton.widthAnchor.constraint(equalTo: self.roundImageView.widthAnchor, multiplier: 1).isActive = true
        profileButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        profileButton.addTarget(self, action: #selector(self.btProfile(_:)), for: .touchUpInside)
        
        
        
        let moreImageView = UIImageView()
        moreImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(moreImageView)
        moreImageView.backgroundColor = .lightGray
        moreImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        moreImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        moreImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        moreImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let textArea = UITextView()
        textArea.translatesAutoresizingMaskIntoConstraints = false
        
        let name = NSAttributedString(string: "Achsuthan Mahendran", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)])
        let breakText = NSAttributedString(string: "\n", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        let address = NSAttributedString(string: "Some where under blue sky", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)])
        
        let totalText = NSMutableAttributedString()
        totalText.append(name)
        totalText.append(breakText)
        totalText.append(address)
        textArea.attributedText = totalText
        self.addSubview(textArea)
        textArea.textContainer.maximumNumberOfLines = 2
        textArea.isSelectable = false
        textArea.isScrollEnabled = false
        textArea.leadingAnchor.constraint(equalTo: self.roundImageView.trailingAnchor, constant: 5).isActive = true
        textArea.trailingAnchor.constraint(equalTo: moreImageView.leadingAnchor, constant: -5).isActive = true
        textArea.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        textArea.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    @IBAction func btProfile(_: Any){
        print("Profile button clicked")
        let storyBoard  = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        self.navigation?.pushViewController(view, animated: true)
    }
}
