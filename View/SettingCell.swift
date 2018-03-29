//
//  SettingCell.swift
//  HoverflyBeta
//
//  Created by Aaron Slusser on 3/28/18.
//  Copyright © 2018 Aaron Slusser. All rights reserved.
//

import UIKit

class SettingCell: UICollectionViewCell {
    let LogoutButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Logout", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "SanFranciscoDisplay-Regular", size: 13)
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews() {
        //super.setupViews()
        backgroundColor = .blue
        addSubview(LogoutButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder:) has not been implementented")
    }
}
