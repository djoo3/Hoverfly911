//
//  SettingsLauncher.swift
//  HoverflyBeta
//
//  Created by Aaron Slusser on 3/28/18.
//  Copyright © 2018 Aaron Slusser. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let LogoutButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Logout", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "SanFranciscoDisplay-Regular", size: 13)
        
        return button
    }()
    
    let blackView = UIView()
    
    let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    private func setUpMenuButtons(){
        LogoutButton.leftAnchor.constraint(equalTo: collectionView.centerXAnchor, constant: 12).isActive = true
        LogoutButton.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 12).isActive = true
        LogoutButton.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
    }
    
    @objc func showSettings() {
        if let window = UIApplication.shared.keyWindow{
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            
            collectionView.frame = CGRect(x: window.frame.width, y: 0, width: window.frame.width/2+100, height: window.frame.height)
            collectionView.addSubview(LogoutButton)
            setUpMenuButtons()
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: window.frame.width/2-100, y: 0, width: window.frame.width/2+100, height: window.frame.height)
            }, completion: nil)
        }
        
        
    }
    
    @objc func handleDismiss(){
        if let window = UIApplication.shared.keyWindow{
            
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                self.blackView.alpha = 0
                self.collectionView.alpha = 1
                self.collectionView.frame = CGRect(x: (window.frame.width + window.frame.width/2+100), y: 0, width: window.frame.width/2+100, height:  window.frame.height)
                
            }, completion: nil)
        }
        
    }
    
    
    
    
    @objc func handleLogout(){
        print("logout")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
        
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
    }
}
