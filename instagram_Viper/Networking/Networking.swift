//
//  Networking.swift
//  instagram_Viper
//
//  Created by A on 8/14/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase

class Networking {
   static let shared = Networking()
   var UserName = String()
    func registerUser(_ email:String,_ userName:String,_ password :String,completion:@escaping(_ sucess : Bool)->Void){
        
    let signUpManager = FirebaseAuthManager()
         signUpManager.createUser(email: email, password: password) {[weak self] (success) in
         guard let `self` = self else { return }
     
         if (success) {
            self.UserName = userName
            completion(true)
            
         } else {
           completion(false)
         }
     }
  }
    
    func signIn(_ email:String, _ password:String , completion :@escaping(Bool) -> Void){
          let loginManager = FirebaseAuthManager()
         loginManager.signIn(email: email, pass: password) {[weak self] (success) in
               guard let `self` = self else { return }
               if (success) {
                   completion(true)
             
               } else {
               
                  completion(false)
                
            }
         }
    
    }
    
    func saveUserInDatabase(_ uid:String){
          var refreence = DatabaseReference()
         refreence = Database.database().reference()
         refreence.child("users").child(uid).setValue(["username": UserName]) {
           (error:Error?, ref:DatabaseReference) in
           if let error = error {
             print("Data could not be saved: \(error).")
           } else {
             print("Data saved successfully!")
           }
         }
     }
    
    
    func saveImagePostToFireabse(_ refreance : StorageReference,_ image:UIImage ,_ caption:String, completion:@escaping(Bool)->Void){
        StorageServiceFireBase.uploadImage(image, reference: refreance, caption) { (sucees) in
        
            completion(sucees)
        }
    }
    
    func fetchAllUsers(includeCurrentUser: Bool = false, completion: @escaping ([User]) -> (), withCancel cancel: ((Error) -> ())?) {
          let ref = Database.database().reference().child("users")
          ref.observeSingleEvent(of: .value, with: { (snapshot) in
              guard let dictionaries = snapshot.value as? [String: Any] else {
                  completion([])
                  return
              }
              
              var users = [User]()
              
              dictionaries.forEach({ (key, value) in
                  if !includeCurrentUser, key == Auth.auth().currentUser?.uid {
                      completion([])
                      return
                  }
                  guard let userDictionary = value as? [String: Any] else { return }
                  let user = User(uid: key, dictionary: userDictionary)
                  users.append(user)
              })
              
//              users.sort(by: { (user1, user2) -> Bool in
//                  return user1.username.compare(user2.username) == .orderedAscending
//              })
            print(users)
              completion(users)
              
          }) { (err) in
              print("Failed to fetch all users from database:", (err))
              cancel?(err)
          }
      }
}
