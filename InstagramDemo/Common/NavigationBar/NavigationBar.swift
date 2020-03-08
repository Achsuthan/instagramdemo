//
//  NavigationBar.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/1/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class NavigationBar: UIView {
    
    var lineView : LineView = {
        let view = LineView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleImage: UIImageView = {
        let titleImage = UIImageView()
        titleImage.image = UIImage(named: "appLogo")
        titleImage.contentMode = .scaleAspectFit
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        return titleImage
    }()
    
    var messageView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var messageBadgeView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var lblMessageCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.text = "3"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    private func setUp(){
        self.setUpBackView()
        self.setUpTitleView()
        self.setUpMoreView()
        self.setUpMessageBadgeView()
        self.setUpBottomLine()
    }
    
    private func setUpBottomLine(){
        self.addSubview(lineView)
        self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    private func setUpMessageBadgeView(){
        self.addSubview(self.messageBadgeView)
        self.messageBadgeView.topAnchor.constraint(equalTo: self.messageView.topAnchor, constant: -10).isActive = true
        self.messageBadgeView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.messageBadgeView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.messageBadgeView.trailingAnchor.constraint(equalTo: self.messageView.trailingAnchor, constant: 10).isActive = true
        self.messageBadgeView.layer.cornerRadius = 15
        
        self.messageBadgeView.addSubview(self.lblMessageCount)
        self.lblMessageCount.centerXAnchor.constraint(equalTo: self.messageBadgeView.centerXAnchor).isActive = true
        self.lblMessageCount.centerYAnchor.constraint(equalTo: self.messageBadgeView.centerYAnchor).isActive = true
    }
    
    private func setUpMoreView(){
        self.addSubview(self.messageView)
        self.messageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        self.messageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.messageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.messageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.messageView.layer.cornerRadius = 20
    }
    private func setUpTitleView(){
        self.addSubview(self.titleView)
        self.titleView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.titleView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.titleView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.titleView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        self.titleView.addSubview(self.titleImage)
        self.titleImage.heightAnchor.constraint(equalTo: self.titleView.heightAnchor).isActive = true
        self.titleImage.widthAnchor.constraint(equalTo: self.titleView.widthAnchor).isActive = true
        self.titleImage.centerXAnchor.constraint(equalTo: self.titleView.centerXAnchor).isActive = true
        self.titleImage.centerYAnchor.constraint(equalTo: self.titleView.centerYAnchor).isActive = true
    }
    private func setUpBackView(){
        self.addSubview(self.backView)
        self.backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.backView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.backView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.backView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.backView.layer.cornerRadius = 20
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
