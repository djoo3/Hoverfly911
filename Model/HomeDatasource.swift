//
//  HomeDatasource.swift
//  HoverflyBeta
//
//  Created by Aaron Slusser on 3/24/18.
//  Copyright © 2018 Aaron Slusser. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    let newstitle = ["Hoverfly's Automated Drones Rescue 20 Beached Whales off California Coast","How to Become an Official Editor for Hoverfly"]
    let newsimages = [#imageLiteral(resourceName: "Shoreline"),#imageLiteral(resourceName: "FCPdrone")]
    let newsdescription = ["Hoverfly description ...", "Hoverfly description 2"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return[NewsFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [NewsHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [NewsCell.self, UserHistoryCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        let objects: (String, UIImage, String) = (newstitle[indexPath.item], newsimages[indexPath.item], newsdescription[indexPath.item])
        return objects
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return newstitle.count
    }
}

