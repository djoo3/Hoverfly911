//
//  CustomTabBarController.swift
//  HoverflyBeta
//
//  Created by Aaron Slusser on 3/27/18.
//  Copyright © 2018 Aaron Slusser. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeDatasourceController = HomeDatasourceController()
        let navigationController = UINavigationController(rootViewController: homeDatasourceController)
        homeDatasourceController.title = "Home"
        homeDatasourceController.tabBarItem.image = UIImage(named: "NewsIcon")
        
        viewControllers = [navigationController]
        
    }
}
