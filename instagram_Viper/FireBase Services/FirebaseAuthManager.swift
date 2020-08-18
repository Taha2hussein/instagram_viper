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
                
                 let secondsFrom1970 = dictionary["creationDate"] as? Double ?? 0
                let Data = Date(timeIntervalSince1970: secondsFrom1970)
                
                guard let userDictionary = value as? [String: Any] else { return }
                let post = homeModel(userDictionary["caption"] as! String, Data, userDictionary["id"] as! String, userDictionary["imageHeight"] as! Float, userDictionary["imageWidth"] as! Float, userDictionary["imageUrl"] as! String)
                psotModel.append(post)
            })
            completion(psotModel)
            })
            { (err) in
                print("Failed to fetch all posts from database:", (err))
                cancel?(err)
            }
        
    }
    
}
