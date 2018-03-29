//
//  NewsHeaderFooter.swift
//  HoverflyBeta
//
//  Created by Aaron Slusser on 3/24/18.
//  Copyright © 2018 Aaron Slusser. All rights reserved.
//

import LBTAComponents

class NewsFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
    }
}

class NewsHeader: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "NEWSFEED"
        label.font = UIFont(name: "SanFranciscoDisplay-Heavy", size: 33)
        label.textColor =  UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(textLabel)
        //textLabel.fillSuperview()
        textLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
