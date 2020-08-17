//
//  searchRouter.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

protocol searchRouting : class{
    
}


class searchRouter{
    var view: UIViewController?
    init(view : UIViewController){
        self.view = view
    }
}
extension searchRouter:searchRouting{
    
}
