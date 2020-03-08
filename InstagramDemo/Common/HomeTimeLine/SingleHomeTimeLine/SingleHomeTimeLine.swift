//
//  SingleHomeTimeLine.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/7/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class SingleHomeTimeLine: UICollectionViewCell {
    
    let timeLineuserDetails: TimeLineUserDetailsBar = {
        let view = TimeLineUserDetailsBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineView: LineView = {
        let view =  LineView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineView1: LineView = {
        let view =  LineView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let singleLargeImage: SingleLargeImageView = {
        let image = SingleLargeImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let storyOption: StoryOption = {
        let view = StoryOption()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
    }
    
    private func setUp(){
        
        self.addSubview(lineView)
        lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        
        self.addSubview(timeLineuserDetails)
        timeLineuserDetails.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        timeLineuserDetails.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        timeLineuserDetails.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        timeLineuserDetails.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        
        self.addSubview(lineView1)
        lineView1.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineView1.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lineView1.topAnchor.constraint(equalTo: self.timeLineuserDetails.bottomAnchor, constant: 4.5).isActive = true
        lineView1.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        
        self.addSubview(singleLargeImage)
        singleLargeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        singleLargeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        singleLargeImage.topAnchor.constraint(equalTo: self.lineView1.bottomAnchor, constant: 0).isActive = true
        singleLargeImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.addSubview(storyOption)
        storyOption.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        storyOption.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        storyOption.topAnchor.constraint(equalTo: self.singleLargeImage.bottomAnchor, constant: 5).isActive = true
        storyOption.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
