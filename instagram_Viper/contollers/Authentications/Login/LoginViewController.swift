//
//  ViewController.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import IBAnimatable


protocol LoginView: class {
    func logIn()
    func disableLoginButton()
    func failedToLogin()
}

class LoginViewController: UIViewController {

    @IBOutlet weak var signinButton: AnimatableButton!
    
    @IBOutlet weak var emailTextField: AnimatableTextField!
    
    @IBOutlet weak var passwordTextField: AnimatableTextField!
    
    // Mark : Variables
    
    var presenter : LoginPresentation!
    
    // Mark:life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true

    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        disableLoginButton()
        logIn()
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        presenter.segueToRegister()
    }
    func enableLoginButton() {
               signinButton.isEnabled = true
               signinButton.isUserInteractionEnabled = true
       }
}



extension LoginViewController :LoginView{
    func failedToLogin() {
        // show alert for user
             let navigation = Navigations()
             navigation.showAlert("An error occured", view: self)
             navigation.closure = {[weak self] presed in
                 if presed{
                     print("wow")
                     self?.enableLoginButton()
                 }
                 else{
                     //
                 }
             }
    }
    
   
    
    func disableLoginButton() {
        signinButton.isEnabled = false
        signinButton.isUserInteractionEnabled = false
    }
    
    func logIn() {
        guard let email = emailTextField.text , !email.isEmpty else {
            return
        }
        
        guard let password = passwordTextField.text , !password.isEmpty else {
            return
        }
        
        presenter.Login(email, password)
    }
    
    
}
