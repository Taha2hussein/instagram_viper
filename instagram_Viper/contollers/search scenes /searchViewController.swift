//
//  searchViewController.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import IBAnimatable
import Firebase
import ListPlaceholder

protocol searchView : class {
    func getAllUsers()
    func failedToLoadUser()
    func reloadTableView()
    func shlowLoader()
    func hideLoader()
    func showRefreshControl()
    func hideRefreshcontrol()
}
class searchViewController: UIViewController {
    
    // Mark : Variables
    var presenter : searchPresentation?
    private var pullControl = UIRefreshControl()
    //Mark: outlets
    
    @IBOutlet weak var searchTextFiled: AnimatableTextField!
    @IBOutlet weak var searchTableView: UITableView!
    
    // Mark : life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextFiled.delegate = self
        showRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        getAllUsers()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @objc func refresh(sender:AnyObject) {
        getAllUsers()
    }
    
}
extension searchViewController :searchView{
    func hideRefreshcontrol() {
        self.searchTableView?.refreshControl?.endRefreshing()
    }
    
    func showRefreshControl() {
        pullControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        searchTableView?.refreshControl = pullControl
    }
    
    func shlowLoader() {
        searchTableView.showLoader()
    }
    
    func hideLoader() {
        searchTableView.hideLoader()
        
    }
    
    func reloadTableView() {
        self.searchTableView.reloadData()
    }
    
    func failedToLoadUser() {
        Navigations.shared.showAlert("An error occureds", view: self)
    }
    
    func getAllUsers() {
        
        presenter?.getUser()
    }
    
    
    
}


extension searchViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.setCellForTableView(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchTableViewCell", for: indexPath)as! searchTableViewCell
        presenter?.configureCell(cell, indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
}


extension searchViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextFiled.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let searchText  = textField.text ?? ""
        presenter?.searchUser(user: searchText)
    }
    
    
    
}
