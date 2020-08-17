//
//  LogintRouter.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
protocol LoginRouting :class{
    
    func navigateToRegisterView()
    func NavigateToHome()
}

class LoginRouter{
   weak  var view : UIViewController?
    init(view:UIViewController){
        self.view = view
    }
}
extension LoginRouter:LoginRouting{
    func NavigateToHome() {
       let home =  Navigations.shared.getHome()
        view?.navigationController?.pushViewController(home, animated: true)
    }
    
    func navigateToRegisterView() {
        let registerView = registerBuilder.Build()
        view?.navigationController?.pushViewController(registerView, animated: true)
    }
    
    
}
