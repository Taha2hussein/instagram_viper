//
//  LoginInteractor.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
protocol LoginUseCase {
    func signIn(_ email:String,_ password:String)
}

class LoginInteractor{
   weak var presenter : LoginPresenter?
}
extension LoginInteractor:LoginUseCase{
    func signIn(_ email: String, _ password: String) {
  
        Networking.shared.signIn(email, password) {[weak self] (sucess) in
            self?.presenter?.getResponse(sucess)
            print(sucess)
        }
    }
    
    
}
