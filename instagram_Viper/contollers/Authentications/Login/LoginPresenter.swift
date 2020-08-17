//
//  LoginPresenter.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit


protocol LoginPresentation {
    func segueToRegister()
    func Login(_ email:String , _ password:String)
    func getResponse(_ sucess:Bool)
}

class LoginPresenter{
    weak var view : LoginView?
    var router:LoginRouting?
    var interactor: LoginUseCase?
    init(view:LoginView, interactor: LoginUseCase,router: LoginRouting){
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}
extension LoginPresenter:LoginPresentation{
    func getResponse(_ sucess: Bool) {
        if sucess{
            print("great")
            router?.NavigateToHome()
        }
        else{
            view?.failedToLogin()
        }
    }
    
    func Login(_ email: String, _ password: String) {
        interactor?.signIn(email, password)
        print("what?")
    }
    
    func segueToRegister() {
        router?.navigateToRegisterView()
    }
    
    
}
