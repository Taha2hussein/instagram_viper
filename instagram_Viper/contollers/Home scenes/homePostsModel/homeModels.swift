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
    
    init(_ caption:String,_ creationDate : Date , _ id : String, _ imageHeight:Float , _ imageWidth : Float , _ imageUrl : String) {
        self.caption = caption
        self.creationDate = creationDate
        self.id = id
        self.imateHeight = imageHeight
        self.imageWidth = imageWidth
        self.imageUrl = imageUrl
        
    }
}

