//
//  homeBuilder.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
class homeBuilder {
    
    static func Build() -> UIViewController{
        
        let view  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "homeViewController")as homeViewController
   
        let router = homeRouter(view: view)
        let interactor = homeInteractor()
        let presenter = homePresenter(view: view, router: router, interactor: interactor)
        
        interactor.presenter  = presenter
        view.presenter = presenter
        return view
        
    }
}
