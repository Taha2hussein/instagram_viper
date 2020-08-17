//
//  registerInteractor.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase

protocol registerUseCases {
     func register(_ email:String,_ userName:String,_ password :String)
  
}

class registerInteractor{
   weak var presenter : registerPresnter?
}
extension registerInteractor:registerUseCases{
   
    
    func register(_ email: String, _ userName: String, _ password: String) {
//        Networking.shared.registerUser(email, userName, password)
        Networking.shared.registerUser(email, userName, password) {[weak self] (sucess) in
            self?.presenter?.getRespnse(sucess)
        }
    }
    
    
}
