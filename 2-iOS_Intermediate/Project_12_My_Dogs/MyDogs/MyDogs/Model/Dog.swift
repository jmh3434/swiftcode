//
//  Dog.swift
//  MyDogs
//
//  Created by James Hunt on 7/7/21.
//

import Foundation
import UIKit

class Dog {
    var name: String
    var color: String
    var favoriteTreat: String
    var image: String
    
    init(name: String, color:String, favoriteTreat:String, image: String) {
        self.name = name
        self.color = color
        self.favoriteTreat = favoriteTreat
        self.image = image
    }
}
