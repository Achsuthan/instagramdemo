//
//  SingleStory.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/7/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class SingleStory: UICollectionViewCell {
    
    let roundImageView : RoundImageView = {
        let view = RoundImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var name: String? {
        didSet{
            self.setUpName()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
    }
    
    var index: Int? {
        didSet {
            roundImageView.index = index
        }
    }
    
    private func setUp(){
        self.addSubview(self.roundImageView)
        let imageModel = RoundImageModel(viewHeight: 60, imageHeight: 50)
        self.roundImageView.imageModel = imageModel
        roundImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        roundImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        roundImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        roundImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setUpName(){
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = self.name

        if(self.index == 0){
            label.textColor = .lightGray
        }
        else {
            label.textColor = .black
        }

        self.addSubview(label)
        label.font = label.font.withSize(12)
        label.numberOfLines = 0
        label.topAnchor.constraint(equalTo: self.roundImageView.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.textAlignment = .center
    }
    
    
    
    
}
