//
//  Animal.swift
//  Field Survey
//
//  Created by Connor Redmond on 4/29/20.
//  Copyright © 2020 Connor Redmond. All rights reserved.
//

import UIKit

enum Animal: String{
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "icon")
    }
}
