//
//  searchInteractor.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

protocol  searchUseCases : class{
    
    func requesUsers()
}


class searchInteractor{
    weak var presenter : searchPresentation?
}
extension searchInteractor:searchUseCases{
    func requesUsers() {
        Networking.shared.fetchAllUsers(completion: {[weak self] (User) in
            //
//            self?.presenter?.sucessToGetUser(User)
            print("User",User)
            self?.presenter?.sucessToGetUser(User)
        }) {[weak self] (error) in
           
            self?.presenter?.failedToGetUser(error)
            
        }
    }
    
  
}
