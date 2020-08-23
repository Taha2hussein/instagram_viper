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
         getPosts()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
  self.navigationController?.setNavigationBarHidden(true, animated: true)
       
    }

    func getPosts(){
        showListLoading()
        
        let queue = DispatchQueue.global(qos: .userInteractive)
        queue.async() { () -> Void in
              self.presenter?.psotLikes()
           
          
        }
         let queue1 = DispatchQueue.global(qos: .background)
        queue1.async() { () -> Void in
           self.presenter?.getPosts()
        }
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
        
        cell.likeTapped = {[weak self] in
           
            let btnImag = cell.likeButton.image(for: .normal)
            
            if btnImag == UIImage(named: "like_selected"){
                 cell.likeButton.setImage(UIImage(named: "like_unselected"), for: UIControl.State.normal)
                self?.presenter?.postUnlikeButtonTapped(indexPath.row)
              
            }
            else{
                cell.likeButton.setImage(UIImage(named: "like_selected"), for: UIControl.State.normal)
                 self?.presenter?.postlikeButtonTapped(indexPath.row)
                
            }
            
        }
        
        cell.commentTapped = {[weak self] in
            
            self?.presenter?.postcommentButtonTapped(indexPath.row)
            
        }
        
        cell.postSetting = {[weak self] in
            
            self?.presenter?.postsettingButtonTapped(indexPath.row)
            
            
        }
        
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
