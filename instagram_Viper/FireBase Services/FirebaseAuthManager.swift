//
//  FirebaseAuthManager.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase
class FirebaseAuthManager{
    
    
   
func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
       Auth.auth().createUser(withEmail: email, password: password) {[weak self](authResult, error) in
           if let user = authResult?.user {
         
              
            // save user in fireBase Database
           performOn(.Background) {
            Networking.shared.saveUserInDatabase(user.uid)
            }
             completionBlock(true)
            
            print(user.uid)
           } else {
               completionBlock(false)
           }
        }
    }
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) {(result, error) in
            if let error = error, let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
      }

}
