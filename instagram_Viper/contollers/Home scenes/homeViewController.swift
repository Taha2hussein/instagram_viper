//
//  homeViewController.swift
//  instagram_Viper
//
//  Created by A on 8/16/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase

protocol homeView : class{
    func showListLoading()
    func hideListLoading()
    func reloadData()
    func showRefreshControl()
    func hideRefreshcontrol()
}

class homeViewController: UIViewController {

    
    @IBOutlet weak var postTableView: UITableView!
    
    // Mark :  variables
     var presenter : homePresentation?
     private var pullControl = UIRefreshControl()
    
    // Mark : life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showRefreshControl()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      
  self.navigationController?.setNavigationBarHidden(true, animated: true)
        getPosts()
    }

    func getPosts(){
        showListLoading()
        presenter?.getPosts()
    }
    
    @objc func refresh(sender:AnyObject) {
        getPosts()
    }
}


extension homeViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.number_post_cell(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath)as! homeTableViewCell
        presenter?.postCell(cell, indexPath)
        return cell
        
    }
    
    
}


extension homeViewController : homeView{
    func showRefreshControl() {
         pullControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        postTableView?.refreshControl = pullControl
    }
    
    func hideRefreshcontrol() {
        self.postTableView?.refreshControl?.endRefreshing()
    }
    
    func showListLoading() {
        postTableView.showLoader()
    }
    
    func hideListLoading() {
        postTableView.hideLoader()
    }
    
    func reloadData() {
        postTableView.reloadData()
    }
    
    
}
