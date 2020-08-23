//
//  profileViewController.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {
    var presenter : homePresentation!
      
      // Mark : life cycle
      override func viewDidLoad() {
          super.viewDidLoad()

        
      }
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
              self.navigationController?.isNavigationBarHidden = true
      }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
      
        presenter?.show()
    }
}
