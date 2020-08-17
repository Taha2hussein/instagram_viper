//
//  postBuilder.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

class postBuilder {
    
    static func Build() -> UIViewController{
        
        let view  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "postViewController")as postViewController
        
        let interactor = postInteractor()
        let router = postRouter(view: view)
        let presenter = postPresenter(view: view, router: router, interactor: interactor)
        interactor.presenter = presenter
        view.presenter = presenter
        return view
        
    }
}
