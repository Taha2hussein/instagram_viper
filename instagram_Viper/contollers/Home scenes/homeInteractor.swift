//
//  homeInteractor.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

protocol  homeUseCases:class {
func getPosts()
    func likePost(_ uid:String , _ postID:String)
    func likeUnPost(_ uid:String , _ postID:String)
    func postLike()
}
class homeInteractor {
    weak var presenter : homePresenter?
}


extension homeInteractor : homeUseCases{
   
    
    func likeUnPost(_ uid: String, _ postID: String) {
         let firebase = FirebaseAuthManager()
        firebase.unLikePost(uid, postId: postID) {[weak self] (sucees) in
            //
            self?.presenter?.unLikePostResponse(sucees)
        }
    }
    
    func likePost(_ uid: String, _ postID: String) {
    let firebase = FirebaseAuthManager()
        firebase.likePost(uid, postId: postID, completion: {[weak self] (sucess) in
            self?.presenter?.LikePostResponse(sucess: sucess)
        })
    }
    func postLike() {
            let firebase = FirebaseAuthManager()
        firebase.getPostLikes(completion: {[weak self] (likes) in
            self?.presenter?.sucessToGetPostLikes(likes)
        }) {[weak self] (error) in
            self?.presenter?.failestoGetPostLikes(error)
        }
       }
    func getPosts() {
        let firebase = FirebaseAuthManager()
        firebase.getUserPost(completion: {[weak self] (homeModelPost) in
            self?.presenter?.sucessToGetUserPosts(homeModelPost)
        }) {[weak self] (error) in
            self?.presenter?.failedToGetUserPosts(error)
        }
    }
    
    
    
}
