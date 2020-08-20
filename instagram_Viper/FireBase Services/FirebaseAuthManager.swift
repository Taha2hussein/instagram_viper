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
    
    func uploadPostToFirebase(_ url : String, _ postId:String,_ image: UIImage,_ caption:String,_ userPostRef : DatabaseReference){
        print(url)
        
        
        let values = ["imageUrl": url, "caption": caption, "imageWidth": image.size.width, "imageHeight": image.size.height, "creationDate": Date().timeIntervalSince1970, "id": postId] as [String : Any]
        
        userPostRef.updateChildValues(values) { (err, ref) in
            if let err = err {
                print("Failed to save post to database", err)
                
                return
            }
            else{
                print("sucees to upload Data to firebase")
            }
        }
    }
    
    func getUserPost(completion:@escaping([homeModel])-> (), withCancel cancel: ((Error) -> ())?){
        Database.database().reference().child("posts").child(Auth.auth().currentUser!.uid).queryOrderedByKey().observeSingleEvent(of: .value, with: { snapshot in
            
            guard let dictionary = snapshot.value as? [String:AnyObject] else {
                print("Error")
                completion([])
                return
            }
            print("dictionary",dictionary)
            var psotModel = [homeModel]()
            dictionary.forEach({ (key, value) in
                
                
                
                guard let userDictionary = value as? [String: Any] else { return }
                
                let post = homeModel(userDictionary as [String : AnyObject])
                psotModel.append(post)
            })
            completion(psotModel)
        })
        { (err) in
            print("Failed to fetch all posts from database:", (err))
            cancel?(err)
        }
        
    }
    
    func likePost(_ uid:String , postId:String , completion:@escaping(Bool)->() ){
        var ref = DatabaseReference()
        ref = Database.database().reference()
        let Data = [uid : 1]
        ref.child("likes").child(postId).setValue(Data){
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
            completion(false)
          } else {
            print("Data saved successfully!")
            completion(true)
          }
        }
    }
    
    
    func unLikePost(_ uid:String , postId:String , completion:@escaping(Bool)->() ){
           var ref = DatabaseReference()
           ref = Database.database().reference()
         
        ref.child("likes").child(postId).removeValue(){
             (error:Error?, ref:DatabaseReference) in
             if let error = error {
               print("Data could not be saved: \(error).")
               completion(false)
             } else {
               print("Data saved successfully!")
               completion(true)
             }
           }
       }
    
    func getPostLikes(completion:@escaping([likes])->() , withCancel cancel: ((Error) -> ())?){
        Database.database().reference().child("likes").queryOrderedByKey().observeSingleEvent(of: .value, with: { snapshot in
            
            guard let dictionary = snapshot.value as? [String:AnyObject] else {
                print("Error")
                completion([])
                return
            }
         
            var likesModel = [likes]()
            dictionary.forEach({ (key, value) in
                
                
                
                guard let userDictionary = value as? [String: Any] else { return }
               
                let uid = Auth.auth().currentUser?.uid
                if (userDictionary.keys.first) == uid{
                let like = likes(id: key)
                
                likesModel.append(like)
               
                }
            })
            completion(likesModel)
        })
        { (err) in
            print("Failed to fetch all posts from database:", (err))
            cancel?(err)
        }
    }
}
