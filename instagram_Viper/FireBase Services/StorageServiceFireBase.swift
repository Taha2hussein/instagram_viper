//
//  StorageServiceFireBase.swift
//  instagram_Viper
//
//  Created by A on 8/17/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import Foundation
import UIKit
import Firebase

struct StorageServiceFireBase {
    
    
    // provide method for uploading images
    static func uploadImage(_ image: UIImage, reference: StorageReference,_ caption:String, completion: @escaping (Bool) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            return completion(false)
        }
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userPostRef = Database.database().reference().child("posts").child(uid).childByAutoId()
          guard let postId = userPostRef.key else { return }
        
        // store images in storages
        reference.child(postId).putData(imageData, metadata: metaData, completion: { (metadata, error) in
            if let error = error {
                print("Upload failed :: ",error.localizedDescription)
                return completion(false)
            }
            else{
                
                // store Data in Data base
                reference.downloadURL { url, error in
                    guard let postImageUrl = url?.absoluteString else { return }
                    let values = ["imageUrl": postImageUrl , "caption": caption, "imageWidth": image.size.width, "imageHeight": image.size.height, "creationDate": Date().timeIntervalSince1970, "id": postId] as [String : Any]
                             
                             userPostRef.updateChildValues(values) { (err, ref) in
                                 if let err = err {
                                     print("Failed to save post to database", err)
                                  
                                     return
                                 }
                                 else{
                                    print("sucees to upload Data to firebase")
                                }
                             }
                    completion(true)
                    
                }
            }
            
        })
    }
}
