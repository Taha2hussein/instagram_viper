//
//  postRouter.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit


protocol postRouting : class {
    func move()
}

class postRouter{
    

    weak var view : UIViewController?
    init(view:UIViewController) {
        self.view = view
    }
}
extension postRouter :postRouting{
    func move() {
    // here i want to switch from specific index to 0  in tab bar
        
        
        let tabBarController = tabBarBuider.Build(subModules: Navigations.shared.subModules)
               
        _ = UIApplication.shared.delegate as! AppDelegate
        UIApplication.shared.keyWindow?.rootViewController = tabBarController
    }
    
    
}
