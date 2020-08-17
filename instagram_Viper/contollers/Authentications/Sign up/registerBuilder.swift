//
//  registerBuilder.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
class registerBuilder{
    
    static func Build() -> UIViewController{
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
          let view = storyBoard.instantiateViewController(identifier: "SignupViewController")as! SignupViewController
          
          let interactor = registerInteractor()
          let router = registerRouter(view: view)
          let presenter = registerPresnter(view: view, interactor: interactor, router: router)
          view.presenter = presenter
          interactor.presenter = presenter
          return view
    }
}
