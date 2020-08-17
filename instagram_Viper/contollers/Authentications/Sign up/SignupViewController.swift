//
//  SignupViewController.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import IBAnimatable
import Firebase
protocol signUpView:class {
    func register() -> Void
    func disableSignUpButton()
    func enableSignUpButton()
    func failedToRegister()
}
class SignupViewController: UIViewController {

    @IBOutlet weak var signUpButton: AnimatableButton!
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var chosseImageButton: AnimatableButton!
    @IBOutlet weak var passwordTextField: AnimatableTextField!
    
    @IBOutlet weak var userNameTextField: AnimatableTextField!
    
    @IBOutlet weak var emailTextField: AnimatableTextField!
    
    
    // Mark : Variables
    var imagePicker = UIImagePickerController()
    var presenter : registerPresntation!
    
    
    // Mark : life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       imagePicker.delegate = self
        
    }
   
    @IBAction func signUpButtonTapped(_ sender: Any) {
        register()
    }
    
    @IBAction func choosePictureButtonTapped(_ sender: Any) {
        self.choosePhoto()
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        presenter.popView()
    }
    
    func choosePhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
             present(imagePicker, animated: true, completion: nil)
                    imagePicker.sourceType = .photoLibrary
                   imagePicker.allowsEditing = false

              }
        }
}


extension SignupViewController: UINavigationControllerDelegate , UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {


           if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
               userPhoto.contentMode = .scaleToFill
               userPhoto.image = pickedImage
           }


         
           dismiss(animated: true, completion: nil)
       }

       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           dismiss(animated: true, completion:nil)
       }

}


extension SignupViewController :signUpView{
    func failedToRegister() {
        // show alert for user
        let navigation = Navigations()
        navigation.showAlert("An error occured", view: self)
        navigation.closure = {[weak self] presed in
            if presed{
                self?.enableSignUpButton()
            }
            else{
                //
            }
        }
    }
    
    func disableSignUpButton() {
        self.signUpButton.isEnabled = false
        self.signUpButton.isUserInteractionEnabled = false
    }
    
    func enableSignUpButton() {
        self.signUpButton.isEnabled = true
        self.signUpButton.isUserInteractionEnabled = true
    }
    
    
    func register() {
        guard  let email = emailTextField.text , !email.isEmpty else {
            return
        }
        guard let userName = userNameTextField.text , !userName.isEmpty else {
            return
        }
        guard let password = passwordTextField.text ,!password.isEmpty else {
            return
        }
        disableSignUpButton()
        presenter.register(email, userName, password)
    }
    
    
}
