//
//  searchBuilder.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
class searchBuilder {
    
    static func Build() -> UIViewController{
        
        let view  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "searchViewController")as searchViewController
   
        let interactor = searchInteractor()
        let router = searchRouter(view: view)
      
        let presenter = searchPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
        
    }
}
