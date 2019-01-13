//
//  ClothingItemCasual.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/11/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

enum Gender {
    case Male
    case Female
    case Other
}

enum Style{
    case Casual
    case Profesional
}

struct clothingItem {
    var name: String
    var gender: Gender
    var style: Style
}


