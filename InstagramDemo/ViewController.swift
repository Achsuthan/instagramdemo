//
//  ViewController.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/1/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let navBar: NavigationBar = {
        let nav = NavigationBar()
        nav.translatesAutoresizingMaskIntoConstraints = false
        return nav
    }()
    
    
    let testView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let notificationBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    private func setUp(){
        self.view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        self.view.addSubview(navBar)
        navBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        navBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        navBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        
        
        self.view.addSubview(self.testView)
        self.testView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        self.testView.topAnchor.constraint(equalTo: self.navBar.bottomAnchor, constant: 100).isActive = true
        self.testView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.testView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.setUpNotification()
        
    }
    
    private func setUpNotification(){
        
        self.view.addSubview(self.notificationBackgroundView)
        self.notificationBackgroundView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.notificationBackgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.notificationBackgroundView.centerXAnchor.constraint(equalTo: self.testView.centerXAnchor).isActive = true
        self.notificationBackgroundView.bottomAnchor.constraint(equalTo: self.testView.topAnchor, constant: -2).isActive = true
        
        let innerView = UIView()
        innerView.backgroundColor = .red
        innerView.translatesAutoresizingMaskIntoConstraints = false
        self.notificationBackgroundView.addSubview(innerView)
        innerView.leadingAnchor.constraint(equalTo: self.notificationBackgroundView.leadingAnchor).isActive = true
        innerView.trailingAnchor.constraint(equalTo: self.notificationBackgroundView.trailingAnchor).isActive = true
        innerView.topAnchor.constraint(equalTo: self.notificationBackgroundView.topAnchor).isActive = true
        innerView.bottomAnchor.constraint(equalTo: self.notificationBackgroundView.bottomAnchor, constant: -10).isActive = true
        innerView.layer.cornerRadius = 6
        
        let triangleView = UIView()
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.notificationBackgroundView.addSubview(triangleView)
        triangleView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        triangleView.centerXAnchor.constraint(equalTo: self.notificationBackgroundView.centerXAnchor).isActive = true
        triangleView.topAnchor.constraint(equalTo: innerView.bottomAnchor, constant: 0).isActive = true
        triangleView.bottomAnchor.constraint(equalTo: self.notificationBackgroundView.bottomAnchor, constant: 0).isActive = true
        
        let heightWidth = 20
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x:heightWidth/2, y: heightWidth/2))
        path.addLine(to: CGPoint(x:heightWidth, y:0))
        path.addLine(to: CGPoint(x:0, y:0))
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.red.cgColor
        triangleView.layer.insertSublayer(shape, at: 0)
        
        let loveView = UIView()
        loveView.backgroundColor = .blue
        loveView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let notificationCountView = UIView()
        notificationCountView.backgroundColor = .black
        notificationCountView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let stackView = UIStackView(arrangedSubviews: [loveView, notificationCountView])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = .black
        stackView.translatesAutoresizingMaskIntoConstraints = false
        innerView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: innerView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor).isActive = true
        
        
        let loveImage = UIImageView()
        loveImage.translatesAutoresizingMaskIntoConstraints = false
        loveView.addSubview(loveImage)
        loveImage.backgroundColor = .gray
        loveImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        loveImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loveImage.trailingAnchor.constraint(equalTo: loveView.leadingAnchor, constant: 0).isActive = true
        loveImage.centerYAnchor.constraint(equalTo: loveView.centerYAnchor).isActive = true
        
        
        
        
    }
    
    
}

