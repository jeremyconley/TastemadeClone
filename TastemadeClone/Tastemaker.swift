//
//  Tastemaker.swift
//  TastemadeClone
//
//  Created by Jeremy Conley on 10/27/16.
//  Copyright © 2016 JeremyConley. All rights reserved.
//

import Foundation
import UIKit

struct Tastemaker{
    var name: String
    var description: String
    var picture: UIImage
    
    init(name: String, description: String, picture: UIImage){
        self.name = name
        self.description = description
        self.picture = picture
    }
    
}
