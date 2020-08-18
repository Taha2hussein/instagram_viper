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
}
class homeInteractor {
    weak var presenter : homePresenter?
}


extension homeInteractor : homeUseCases{
    func getPosts() {
        let firebase = FirebaseAuthManager()
        firebase.getUserPost(completion: {[weak self] (homeModelPost) in
            self?.presenter?.sucessToGetUserPosts(homeModelPost)
        }) {[weak self] (error) in
            self?.presenter?.failedToGetUserPosts(error)
        }
    }
    
    
    
}
