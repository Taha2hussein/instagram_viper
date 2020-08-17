//
//  registerPresnter.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase
protocol registerPresntation {
    func popView()
    func register(_ email:String,_ userName:String,_ password :String)
    func getRespnse(_ sucess:Bool)
  
}

class registerPresnter{
    weak var view : signUpView?
     var router:registerRouting?
    var interactor: registerUseCases?
    init(view:signUpView, interactor: registerUseCases,router: registerRouting){
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}
extension registerPresnter:registerPresntation{
   
    
    func getRespnse(_ sucess: Bool) {
        if sucess{
            view?.enableSignUpButton()
             router?.navigateToHome()
        }
        else{
            view?.failedToRegister()
        }
    }
    
    func register(_ email: String, _ userName: String, _ password: String) {
        interactor?.register(email, userName, password)
    }
    
    func popView() {
        router?.navigateToLogin()
    }
    
  
    
}
