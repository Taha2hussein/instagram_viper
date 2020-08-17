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
}


class searchPresenter{
    var router : searchRouting?
    var interactor : searchUseCases?
   weak  var view : searchView?
    var users = [User]()
    init(view: searchView , interactor: searchUseCases , router : searchRouting){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
extension searchPresenter:searchPresentation{
    func configureCell(_ cell: searchTableViewCell, _ indexPath: IndexPath) {
        let user = users[indexPath.row]
        cell.configureCell(cell, User: user)
    }
    
    
    
    func setCellForTableView(_ section: Int) -> Int {
        return users.count
    }
    
    func sucessToGetUser(_ user: [User]) {
        self.users = user
        view?.reloadTableView()
    }
    
    func failedToGetUser(_ error: Error) {
        view?.failedToLoadUser()
    }
    
   
    
    func getUser() {
        interactor?.requesUsers()
    }
    
    
}
