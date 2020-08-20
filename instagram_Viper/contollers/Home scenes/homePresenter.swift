//
//  homePresenter.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase
protocol  homePresentation : class{
    func getPosts()
    func psotLikes()
    func sucessToGetUserPosts( _ homeModel:[homeModel])
    func failedToGetUserPosts(_ error : Error)
    
    func sucessToGetPostLikes(_ likes: [likes])
    func failestoGetPostLikes(_ error : Error)
    func number_post_cell(_ section : Int) -> Int
    func postCell(_ cell : homeTableViewCell, _ indexPath : IndexPath)
    
    
    func postlikeButtonTapped(_ indexPath: Int)
    func postUnlikeButtonTapped(_ indexPath: Int)
    func postcommentButtonTapped(_ indexPath: Int)
    func postsettingButtonTapped(_ indexPath: Int)
    
    func LikePostResponse(sucess:Bool)
    func unLikePostResponse(_ sucess:Bool)
    
}

class homePresenter {
    weak var view : homeView?
    var interactor : homeUseCases?
    var router : homeRouting?
    var postArray = [homeModel]()
    var postLikes = [likes]()
    init(view:homeView,router : homeRouting,interactor:homeUseCases) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


extension homePresenter : homePresentation{
    
    
    
    func unLikePostResponse(_ sucess: Bool) {
        // do what you want
    }
    
    func postUnlikeButtonTapped(_ indexPath: Int) {
        guard let userUid = Auth.auth().currentUser?.uid else{return }
        let post = postArray[indexPath]
        self.interactor?.likeUnPost(userUid, post.id)
    }
    
    func LikePostResponse(sucess: Bool) {
        if sucess{
            print("suces")
            // Do what you want
        }
        else{
            print("fail")
            // Do what you want
        }
    }
    
    func postlikeButtonTapped(_ indexPath: Int) {
        guard let userUid = Auth.auth().currentUser?.uid else{return }
        let post = postArray[indexPath]
        interactor?.likePost(userUid, post.id)
    }
    
    func postcommentButtonTapped(_ indexPath: Int) {
        
    }
    
    func postsettingButtonTapped(_ indexPath: Int) {
        
    }
    
    
    func number_post_cell(_ section: Int) -> Int{
        return postArray.count
    }
    
    func postCell(_ cell: homeTableViewCell, _ indexPath: IndexPath) {
        let post = postArray[indexPath.row]
        cell.postCell(cell, post: post)
        
        
        for item in postLikes{
            if item.post_id == post.id{
                cell.likeButton.setImage(UIImage(named: "like_selected"), for: UIControl.State.normal)
            }
        }
        
    }
    
    
    func sucessToGetPostLikes(_ likes: [likes]) {
        self.postLikes = likes
      
    }
    
    func failestoGetPostLikes(_ error: Error) {
        // Do what you want
    }
    func sucessToGetUserPosts(_ homeModel: [homeModel]) {
        postArray = homeModel
        view?.hideRefreshcontrol()
        view?.reloadData()
        view?.hideListLoading()
        
    }
    
    func failedToGetUserPosts(_ error: Error) {
        //
    }
    
    func psotLikes() {
        self.interactor?.postLike()
    }
    
    func getPosts() {
        postLikes.removeAll()
        postArray.removeAll()
        interactor?.getPosts()
    }
    
    
}
