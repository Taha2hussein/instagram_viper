//
//  registerRouter.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
protocol registerRouting:class {
    
    func navigateToLogin()
       func navigateToHome()
}

class registerRouter{
    weak var view : UIViewController?
    init(view:UIViewController){
        self.view = view
    }
}
extension registerRouter:registerRouting{
    func navigateToHome() {
//        let homeTabBar = Navigations.shared.getHome()
        let tabBarController = tabBarBuider.Build(subModules: Navigations.shared.subModules)
                     
              _ = UIApplication.shared.delegate as! AppDelegate
              UIApplication.shared.keyWindow?.rootViewController = tabBarController
//        view?.navigationController?.pushViewController(homeTabBar, animated: true)
    }
    
    func navigateToLogin() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    
    
}
