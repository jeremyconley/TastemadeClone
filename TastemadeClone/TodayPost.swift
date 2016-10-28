//
//  TodayPost.swift
//  TastemadeClone
//
//  Created by Jeremy Conley on 10/27/16.
//  Copyright © 2016 JeremyConley. All rights reserved.
//

import Foundation
import UIKit

struct TodayPost {
    var dish: String
    var dishPicture: UIImage
    var description: String
    var user: String
    var userPic: UIImage
    
    init(dish: String, dishPicture: UIImage, description: String, user: String, userPic: UIImage){
        self.dish = dish
        self.dishPicture = dishPicture
        self.description = description
        self.user = user
        self.userPic = userPic
    }
    
}
