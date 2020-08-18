//
//  searchPresenter.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

protocol  searchPresentation : class{
    func getUser()
    func sucessToGetUser( _ user:[User])
    func failedToGetUser(_ error : Error)
    func setCellForTableView(_ section :Int) -> Int
    func configureCell(_ cell : searchTableViewCell , _ indexPath : IndexPath)
    func searchUser(user:String)
}


class searchPresenter{
    var router : searchRouting?
    var interactor : searchUseCases?
    weak  var view : searchView?
    var users = [User]()
    var searchArrRes = [User]()
    var searching : Bool = false
    init(view: searchView , interactor: searchUseCases , router : searchRouting){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
extension searchPresenter:searchPresentation{
    func searchUser(user: String) {
        //add matching text to arrya
        searchArrRes = self.users.filter({(($0.username).contains(user))})

            if(searchArrRes.count == 0){
              searching = false
            }else{
              searching = true
           }
        view?.reloadTableView()
    }
    
    func configureCell(_ cell: searchTableViewCell, _ indexPath: IndexPath) {
         if searching == false{
        let user = users[indexPath.row]
        cell.configureCell(cell, User: user)
        }
         else{
            let searchUser = searchArrRes[indexPath.row]
               cell.configureCell(cell, User: searchUser)
        }
    }
    
    
    
    func setCellForTableView(_ section: Int) -> Int {
        if searching == false{
        return users.count
        }
        else{
            return searchArrRes.count
        }
    }
    
    func sucessToGetUser(_ user: [User]) {
        self.users = user
         view?.hideRefreshcontrol()
        view?.reloadTableView()
        view?.hideLoader()
        
    }
    
    func failedToGetUser(_ error: Error) {
        view?.failedToLoadUser()
        view?.hideRefreshcontrol()
    }
    
   
    
    func getUser() {
        view?.shlowLoader()
        interactor?.requesUsers()
    }
    
    
}
