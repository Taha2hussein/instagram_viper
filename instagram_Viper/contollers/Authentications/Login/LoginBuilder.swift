//
//  LoginBuilder.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

class LoginBuilder{
    
    static func Build() -> UIViewController{
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
          let view = storyBoard.instantiateViewController(identifier: "LoginViewController")as! LoginViewController
          
          let interactor = LoginInteractor()
          let router = LoginRouter(view: view)
          let presenter = LoginPresenter(view: view, interactor: interactor, router: router)
          view.presenter = presenter
          interactor.presenter = presenter
          return view
    }
}

