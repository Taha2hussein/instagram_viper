//
//  homeTabBar.swift
//  instagram_Viper
//
//  Created by A on 8/17/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

typealias instagramModules = (
    home:UIViewController,
    search : UIViewController,
    post: UIViewController,
    like:UIViewController,
    profile:UIViewController
)
class homeTabBar: UITabBarController {
     
   
    init(tabs:instagramModules){
       
        super.init(nibName: nil, bundle: nil)
         viewControllers = [tabs.home,tabs.search,tabs.post,tabs.like,tabs.profile]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


    }
}
