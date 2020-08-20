//
//  searchTableViewCell.swift
//  instagram_Viper
//
//  Created by A on 8/17/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit
import Firebase
import IBAnimatable
import Kingfisher
protocol ssearchCellView {
    func configureCell(_ cell : searchTableViewCell , User: User)
}
class searchTableViewCell: UITableViewCell {

    // Mark : Outelts
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: AnimatableImageView!
    
 
    
    // Mark  : lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
extension searchTableViewCell:ssearchCellView{
    func configureCell(_ cell: searchTableViewCell, User: User) {
        self.userName.text = User.username
        let url = URL(string: User.profileImageUrl ?? "")
        imageView?.kf.setImage(with: url)
    }
    
    
}
