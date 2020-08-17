//
//  homeViewController.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    
    
    // Mark : life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      
  self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    
}
