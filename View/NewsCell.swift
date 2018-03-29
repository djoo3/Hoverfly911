//
//  NewsCells.swift
//  HoverflyBeta
//
//  Created by Aaron Slusser on 3/24/18.
//  Copyright © 2018 Aaron Slusser. All rights reserved.
//

import LBTAComponents


class NewsCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet{
            let objects: (String, UIImage, String) = (datasourceItem as? (String, UIImage, String))!
      
            titleLabel.text = objects.0
            titleLabel.font = UIFont(name: "SanFranciscoDisplay-Bold", size: 17)
            titleLabel.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
            NewsImageView.image = objects.1
            DescriptionTextView.text = objects.2
            DescriptionTextView.font = UIFont(name: "SanFranciscoDisplay-Regular", size: 13)
            DescriptionTextView.textColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        }
    }
    
    let NewsImageView: UIImageView = {
        let imageview = UIImageView(image: #imageLiteral(resourceName: "Shoreline"))
        
        imageview.layer.cornerRadius = 5
        imageview.layer.masksToBounds = true
        
        return imageview
    }()
    
    let titleLabel: UITextView = {
        let label = UITextView()
        label.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        label.text = "TEST"
        return label
    }()
    
    let DescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        textView.text = "Zu ein Tausend Jähriges Reich!"
        return textView
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        

        addSubview(titleLabel)
        addSubview(NewsImageView)
        addSubview(DescriptionTextView)
        
        
        
        NewsImageView.anchor(topAnchor, left: self.leftAnchor, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 12, bottomConstant: 12, rightConstant: 12, widthConstant: 0, heightConstant: 200)
        
        titleLabel.anchor(NewsImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 50)
        
        DescriptionTextView.anchor(titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
    }
}

