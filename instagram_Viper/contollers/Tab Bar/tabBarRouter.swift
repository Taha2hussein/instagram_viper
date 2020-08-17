//
//  tabBarRouter.swift
//  instagram_Viper
//
//  Created by A on 8/17/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
class tabBarRouter{
    var viewController : UIViewController
    typealias subModules  = (
        home:UIViewController,
        search : UIViewController,
        post: UIViewController,
        like:UIViewController,
        profile:UIViewController
        
    )
    init(viewController:UIViewController) {
        self.viewController = viewController
    }
}


extension tabBarRouter{
    static func tabs(subModules:subModules) -> instagramModules{
        
        let home = UITabBarItem(title: "", image: UIImage(named: "home_unselected"), selectedImage: UIImage(named: "home_selected"))
        let search = UITabBarItem(title: "", image: UIImage(named: "search_unselected"), selectedImage: UIImage(named: "search_selected"))
        let post = UITabBarItem(title: "", image: UIImage(named: "plus_unselected"), selectedImage: UIImage(named: "plus_unselected"))
        let like = UITabBarItem(title: "", image: UIImage(named: "like_unselected"), selectedImage: UIImage(named: "like_selected"))
        let profile = UITabBarItem(title: "", image: UIImage(named: "profile_unselected"), selectedImage: UIImage(named: "profile_selected"))
    
        subModules.home.tabBarItem = home
        subModules.search.tabBarItem = search
        subModules.post.tabBarItem = post
        subModules.like.tabBarItem = like
        subModules.profile.tabBarItem = profile
        
        return (
            home : subModules.home,
            search : subModules.search,
            post : subModules.post,
            like : subModules.like,
            profile: subModules.profile
        )
    
    }
}
