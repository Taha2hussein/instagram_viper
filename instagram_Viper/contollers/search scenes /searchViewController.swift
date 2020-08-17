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
protocol searchView : class {
    func getAllUsers()
    func failedToLoadUser()
    func reloadTableView()
}
class searchViewController: UIViewController {

    // Mark : Variables
     var presenter : searchPresentation?
    
    @IBOutlet weak var searchTableView: UITableView!
    // Mark : life cycle
      override func viewDidLoad() {
          super.viewDidLoad()

    }
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
        getAllUsers()
              self.navigationController?.isNavigationBarHidden = true
      }
   

}
extension searchViewController :searchView{
    func reloadTableView() {
        self.searchTableView.reloadData()
    }
    
    func failedToLoadUser() {
        self.searchTableView.isHidden = true
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
