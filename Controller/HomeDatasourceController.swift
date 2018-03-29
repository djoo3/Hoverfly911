//
//  HomeDatasourceController.swift
//  HoverflyBeta
//
//  Created by Aaron Slusser on 3/24/18.
//  Copyright © 2018 Aaron Slusser. All rights reserved.
//

import LBTAComponents



class HomeDatasourceController: DatasourceController {
    
    let rightBarSettingsButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "NeuerGrauMenu").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let centerLogoIcon : UIImageView = {
        let logo = UIImageView(image:#imageLiteral(resourceName: "GrauLogo"))
        return logo
    }()
    
    let leftBarProfileButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "NeuGrauProfile").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        collectionView?.backgroundColor = .white
        
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        
        setUpBarButtons()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarSettingsButton)
        navigationItem.titleView = centerLogoIcon
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarProfileButton)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let navBarSeperatorView = UIView()
        navBarSeperatorView.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        view.addSubview(navBarSeperatorView)
        navBarSeperatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    let settingsLauncher = SettingsLauncher()
    
    /*func Logout(){
        print("logout function")
        let vc = UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "identifier") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }*/

    @objc func handleSettingsButton() {
        //show menu
        settingsLauncher.showSettings()

    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    private  func setUpBarButtons(){
        rightBarSettingsButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
        rightBarSettingsButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        rightBarSettingsButton.addTarget(self, action: #selector(handleSettingsButton), for: .touchUpInside)
        
        centerLogoIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
        centerLogoIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        leftBarProfileButton.widthAnchor.constraint(equalToConstant: 32.5).isActive = true
        leftBarProfileButton.heightAnchor.constraint(equalToConstant: 32.5).isActive = true
    }
    
    //CELL
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let objects: (String, UIImage, String) = self.datasource?.item(indexPath) as? (String, UIImage, String){
            let approximateWidthOfTitleText = view.frame.width - 24
            let Attributes = [NSAttributedStringKey.font: UIFont(name: "SanFranciscoDisplay-Regular", size: 13)!]
            
            let size = CGSize(width: approximateWidthOfTitleText, height: 1000)
            let estimatedFrame = NSString(string: objects.2).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: Attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height+250+24+5+8)
        }
        return CGSize(width: view.frame.width, height: 300)
    }
    
    //HEADER
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    //FOOTER
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1{
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
