//
//  tabBarBuider.swift
//  instagram_Viper
//
//  Created by A on 8/17/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
class tabBarBuider{
    static func Build(subModules: tabBarRouter.subModules)-> UITabBarController{
        let tabs = tabBarRouter.tabs(subModules: subModules)
       let tabBarController = homeTabBar(tabs: tabs)
        
        return tabBarController
    }
}
