//
//  homeTableViewCell.swift
//  instagram_Viper
//
//  Created by A on 8/18/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase
import IBAnimatable
import Kingfisher


protocol postCell : class {
    func postCell(_ cell : homeTableViewCell , post: homeModel , postLikes: [likes])
}

class homeTableViewCell: UITableViewCell {

    
    // Mark : outlets
    @IBOutlet weak var photoTimeStamp: UILabel!
    @IBOutlet weak var photoCaption: UILabel!
    @IBOutlet weak var photoPost: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: AnimatableImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    // closures
     var likeTapped : (()->())?
     var commentTapped : (()->())?
     var postSetting : (()->())?
    
    // Mark : life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    @IBAction func commentbuttonTapped(_ sender: Any) {
       
        commentTapped?()
    }
    @IBAction func likebuttonTapped(_ sender: Any) {
       
        likeTapped?()
    }
    @IBAction func postSetting(_ sender: Any) {
           
        postSetting?()
    }
    
}
extension homeTableViewCell : postCell{
    func postCell(_ cell: homeTableViewCell, post: homeModel ,  postLikes: [likes]) {
        self.photoCaption.text = post.caption
        let date = post.creationDate.timeAgoDisplay()
        self.photoTimeStamp.text = date
        let url = URL(string: post.imageUrl)
        self.photoPost.kf.setImage(with: url)
        
        for item in postLikes{
                  if item.post_id == post.id{
                      print(item.post_id)
                    self.likeButton.setImage(UIImage(named: "like_selected"), for: UIControl.State.normal)
                    
                  }
                  else{
                    self.likeButton.setImage(UIImage(named: "like_unselected"), for: UIControl.State.normal)
            }
          
                  
              }
        
      
    }
    
    
    
}
