//
//  homeModels.swift
//  instagram_Viper
//
//  Created by A on 8/18/20.
//  Copyright © 2020 Taha Hussein. All rights reserved.
//

import UIKit

struct homeModel {
    var caption : String!
    var creationDate: Date!
    var id:String!
    var imateHeight : Float!
    var imageWidth:Float!
    var imageUrl : String!
    
    init(_ dictionary : [String:AnyObject]) {
        self.caption = dictionary["caption"] as? String
        self.id = dictionary["id"] as? String
        self.imateHeight = dictionary["imageHeight"] as? Float
        self.imageWidth = dictionary["imageWidth"] as? Float
        self.imageUrl = dictionary["imageUrl"] as? String
        let secondsFrom1970 = dictionary["creationDate"] as? Double ?? 0.0
    self.creationDate = Date(timeIntervalSince1970: secondsFrom1970)
    }
}


