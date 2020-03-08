//
//  RoundImageView.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/7/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class RoundImageView: UIView {
    
    var view:  UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var plusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var index: Int? {
        didSet {
            self.setUp()
            self.setUpPlusView()
        }
    }
    
    var imageModel: RoundImageModel? {
        didSet{
            self.setUp()
            self.setUpPlusView()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        
        self.addSubview(view)
        view.layer.cornerRadius = CGFloat((self.imageModel?.viewHeight ?? 0)/2)
        if(self.index != 0){
            view.layer.borderWidth = 3
        }
        else {
            view.layer.borderWidth = 0
        }
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.layer.borderColor = (self.imageModel?.borderColor ?? UIColor.red).cgColor
        view.heightAnchor.constraint(equalToConstant: CGFloat(self.imageModel?.viewHeight ?? 0)).isActive = true
        view.widthAnchor.constraint(equalToConstant: CGFloat(self.imageModel?.viewHeight ?? 0)).isActive = true
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        let imageView = UIImageView()
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: CGFloat(self.imageModel?.imageHeight ?? 0) ).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: CGFloat(self.imageModel?.imageHeight ?? 0)).isActive = true
        imageView.layer.cornerRadius = CGFloat((self.imageModel?.imageHeight ?? 0)/2)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.backgroundColor = .gray
        
    }
    
    private func setUpPlusView(){
        if(self.index == 0){
            if(self.contains(self.view)){
                view.addSubview(plusView)
                plusView.backgroundColor = .white
                plusView.layer.cornerRadius = 10
                
                plusView.widthAnchor.constraint(equalToConstant: 20).isActive = true
                plusView.heightAnchor.constraint(equalToConstant: 20).isActive = true
                plusView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
                plusView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
                
                let imageView = UIImageView()
                imageView.translatesAutoresizingMaskIntoConstraints = false
                plusView.addSubview(imageView)
                
                imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
                imageView.layer.cornerRadius = 8
                
                imageView.centerYAnchor.constraint(equalTo: plusView.centerYAnchor).isActive = true
                imageView.centerXAnchor.constraint(equalTo: plusView.centerXAnchor).isActive = true
                imageView.backgroundColor = .gray
            }
            
        }
        else {
            if(self.view.contains(self.plusView)){
                self.plusView.removeFromSuperview()
            }
        }
    }
}
