//
//  LineView.swift
//  InstagramDemo
//
//  Created by Achsuthan Mahendran on 3/7/20.
//  Copyright © 2020 Achsuthan Mahendran. All rights reserved.
//

import UIKit

class LineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView)
        lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive  = true
        lineView.backgroundColor = .lightGray
    }
}
