//
//  homePresenter.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

protocol  homePresentation : class{
    func getPosts()
    func sucessToGetUserPosts( _ homeModel:[homeModel])
    func failedToGetUserPosts(_ error : Error)
    func number_post_cell(_ section : Int) -> Int
    func postCell(_ cell : homeTableViewCell, _ indexPath : IndexPath)
}
class homePresenter {
  weak var view : homeView?
    var interactor : homeUseCases?
    var router : homeRouting?
    var postArray = [homeModel]()
    init(view:homeView,router : homeRouting,interactor:homeUseCases) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


extension homePresenter : homePresentation{
    func number_post_cell(_ section: Int) -> Int{
        return postArray.count
    }
    
    func postCell(_ cell: homeTableViewCell, _ indexPath: IndexPath) {
        let post = postArray[indexPath.row]
        cell.postCell(cell, post: post)
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
    

    
    func getPosts() {
        interactor?.getPosts()
    }
    
    
}
