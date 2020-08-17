//
//  postPresenter.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase

protocol postPresentation : class {
    func uplaodPostToFireBase(_ storageRefrence:StorageReference,_ image:UIImage,_ caption:String)
    func getUploadPstRespons(_ sucees:Bool)
}

class postPresenter{
       var interactor : postUseCases?
       var router : postRouting?
       var view : postView?
      init(view:postView , router:postRouting,interactor:postUseCases) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
extension postPresenter :postPresentation{
    func getUploadPstRespons(_ sucees: Bool) {
        // set Tab bar index in 0
        router?.move()
        
    }
    
    func uplaodPostToFireBase(_ storageRefrence: StorageReference, _ image: UIImage,_ caption:String) {
        interactor?.psot_imageToFirebaseStorage(storageRefrence, image: image,caption)
      
    }
    
    
    
    
}
