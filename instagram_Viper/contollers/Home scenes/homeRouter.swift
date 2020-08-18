//
//  homeRouter.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

protocol  homeRouting :class{
    
}
class homeRouter {
   weak var view: UIViewController?
    init(view: UIViewController) {
        self.view = view
    }
}


extension homeRouter : homeRouting{
    
}
