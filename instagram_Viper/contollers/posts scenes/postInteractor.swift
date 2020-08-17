//
//  postInteractor.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase

protocol postUseCases : class {
    func psot_imageToFirebaseStorage(_ fireBaseStorage:StorageReference,image:UIImage,_ caption:String)
  
}

class postInteractor{
  weak  var presenter : postPresentation?
}
extension postInteractor :postUseCases{
    
    
    func psot_imageToFirebaseStorage(_ fireBaseStorage: StorageReference, image: UIImage,_ caption:String) {
        Networking.shared.saveImagePostToFireabse(fireBaseStorage, image,caption) {[weak self] (sucess) in
            self?.presenter?.getUploadPstRespons(sucess)
        }
    }
    
    
}
