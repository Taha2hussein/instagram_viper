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
    func postCell(_ cell : homeTableViewCell , post: homeModel)
}

class homeTableViewCell: UITableViewCell {

    @IBOutlet weak var photoTimeStamp: UILabel!
    @IBOutlet weak var photoCaption: UILabel!
    @IBOutlet weak var photoPost: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: AnimatableImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func commentbuttonTapped(_ sender: Any) {
        
    }
    @IBAction func likebuttonTapped(_ sender: Any) {
        
    }
    @IBAction func postSetting(_ sender: Any) {
        
    }
    
}
extension homeTableViewCell : postCell{
    func postCell(_ cell: homeTableViewCell, post: homeModel) {
        self.photoCaption.text = post.caption
        let date = post.creationDate.timeAgoDisplay()
        self.photoTimeStamp.text = date
        let url = URL(string: post.imageUrl)
        self.photoPost.kf.setImage(with: url)
    }
    
    
    
}
