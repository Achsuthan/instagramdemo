//
//  NotificationView.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/7/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit
class NotificationView: UIView {
    var counterLabel : UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        let innerView = UIView()
        innerView.backgroundColor = .red
        innerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(innerView)
        innerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        innerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        innerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        innerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        innerView.layer.cornerRadius = 6
        
        let triangleView = UIView()
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(triangleView)
        triangleView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        triangleView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        triangleView.topAnchor.constraint(equalTo: innerView.bottomAnchor, constant: 0).isActive = true
        triangleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
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
        loveView.translatesAutoresizingMaskIntoConstraints = false
        loveView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let notificationCountView = UIView()
        notificationCountView.translatesAutoresizingMaskIntoConstraints = false
        notificationCountView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let stackView = UIStackView(arrangedSubviews: [loveView, notificationCountView])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        innerView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: innerView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor).isActive = true
        
        
        let loveImage = UIImageView()
        loveImage.translatesAutoresizingMaskIntoConstraints = false
        loveView.addSubview(loveImage)
        loveImage.image = #imageLiteral(resourceName: "love")
        loveImage.image = loveImage.image?.withRenderingMode(.alwaysTemplate)
        loveImage.tintColor = .white
        loveImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        loveImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        loveImage.trailingAnchor.constraint(equalTo: loveView.trailingAnchor, constant: 0).isActive = true
        loveImage.centerYAnchor.constraint(equalTo: loveView.centerYAnchor).isActive = true
        
        counterLabel.text = "10"
        counterLabel.textColor = .white
        counterLabel.font = UIFont.boldSystemFont(ofSize: 15)
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationCountView.addSubview(counterLabel)
        counterLabel.centerYAnchor.constraint(equalTo: notificationCountView.centerYAnchor).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: notificationCountView.centerYAnchor).isActive = true
    }
}
